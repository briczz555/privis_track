import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/extensions/project_status_style.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../../core/widgets/offline_banner.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../project_management/presentation/project_form_launcher.dart';
import '../../domain/entities/project_list_entity.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/project_card.dart';
import '../widgets/project_filter_bar.dart';

/// Daftar seluruh proyek dengan filter status dan pagination server-side.
class AllProjectsScreen extends ConsumerStatefulWidget {
  const AllProjectsScreen({super.key});

  @override
  ConsumerState<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends ConsumerState<AllProjectsScreen> {
  ProjectStatus? _selectedStatus;
  bool _isLoadingMore = false;

  String? get _statusApi =>
      _selectedStatus == null ? null : projectStatusToApi(_selectedStatus!);

  Future<void> _refresh() {
    return ref.read(allProjectsProvider(_statusApi).notifier).refresh();
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore) return;
    _isLoadingMore = true;

    try {
      await ref.read(allProjectsProvider(_statusApi).notifier).loadMore();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(readableErrorMessage(error))));
    } finally {
      _isLoadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = allProjectsProvider(_statusApi);
    final projects = ref.watch(provider);
    final data = projects.value;
    final role = ref.watch(authControllerProvider).value?.user.role;
    final canManage = role == AuthRole.admin || role == AuthRole.pm;

    ref.listen(provider, (previous, next) {
      if (next.hasValue && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(readableErrorMessage(next.error!))),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Semua Proyek')),
      floatingActionButton: canManage
          ? FloatingActionButton.extended(
              onPressed: () => startCreateProject(context, ref),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Proyek Baru'),
            )
          : null,
      body: SafeArea(
        top: false,
        child: data != null
            ? NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.extentAfter < 300) {
                    _loadMore();
                  }
                  return false;
                },
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: _AllProjectsContent(
                    data: data,
                    selectedStatus: _selectedStatus,
                    onStatusSelected: (status) =>
                        setState(() => _selectedStatus = status),
                  ),
                ),
              )
            : projects.hasError
            ? AppErrorState(
                title: isOfflineError(projects.error)
                    ? 'Tidak ada koneksi'
                    : 'Gagal memuat daftar proyek',
                message: isOfflineError(projects.error)
                    ? 'Belum ada data luring untuk daftar proyek. '
                          'Sambungkan internet lalu muat ulang.'
                    : readableErrorMessage(projects.error!),
                onRetry: _refresh,
              )
            : const AppLoadingState(message: 'Memuat daftar proyek...'),
      ),
    );
  }
}

class _AllProjectsContent extends StatelessWidget {
  const _AllProjectsContent({
    required this.data,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  final ProjectListEntity data;
  final ProjectStatus? selectedStatus;
  final ValueChanged<ProjectStatus?> onStatusSelected;

  Map<ProjectStatus, int> _countsByStatus() {
    if (data.statusCounts.isNotEmpty) return data.statusCounts;

    // Fallback untuk respons lama yang belum mengirim status_counts.
    final counts = {for (final status in ProjectStatus.values) status: 0};
    for (final project in data.projects) {
      counts[project.status] = (counts[project.status] ?? 0) + 1;
    }
    return counts;
  }

  String _countLabel() {
    final loaded = data.projects.length;
    final total = data.total;
    final selected = selectedStatus;
    final suffix = selected == null ? '' : ' · ${selected.label}';

    if (loaded >= total) return '$total proyek$suffix';
    return '$loaded dari $total proyek$suffix';
  }

  @override
  Widget build(BuildContext context) {
    final projects = data.projects;
    final theme = Theme.of(context);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        if (data.isFromCache)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                0,
              ),
              child: OfflineBanner(cachedAt: data.cachedAt),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              0,
            ),
            child: ProjectFilterBar(
              counts: _countsByStatus(),
              selected: selectedStatus,
              onSelected: onStatusSelected,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Text(
              _countLabel(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ),
        ),
        if (projects.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: AppEmptyState(
                message: 'Tidak ada proyek dengan status ini.',
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverList.separated(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  project: project,
                  onTap: () => context.pushNamed(
                    AppRoutes.projectTracking,
                    pathParameters: {'projectCode': project.code},
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
            ),
          ),
        if (data.isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
      ],
    );
  }
}
