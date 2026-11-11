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
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/project_list_entity.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/project_card.dart';
import '../widgets/project_filter_bar.dart';

/// Daftar seluruh proyek (semua status) dengan filter.
class AllProjectsScreen extends ConsumerStatefulWidget {
  const AllProjectsScreen({super.key});

  @override
  ConsumerState<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends ConsumerState<AllProjectsScreen> {
  ProjectStatus? _selectedStatus;

  Future<void> _refresh() => ref.read(allProjectsProvider.notifier).refresh();

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(allProjectsProvider);
    final data = projects.value;

    ref.listen(allProjectsProvider, (previous, next) {
      if (next.hasValue && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(readableErrorMessage(next.error!))),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Semua Proyek')),
      body: SafeArea(
        top: false,
        child: data != null
            ? RefreshIndicator(
                onRefresh: _refresh,
                child: _AllProjectsContent(
                  data: data,
                  selectedStatus: _selectedStatus,
                  onStatusSelected: (status) =>
                      setState(() => _selectedStatus = status),
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

  int _statusPriority(ProjectStatus status) => switch (status) {
    ProjectStatus.inProgress => 0,
    ProjectStatus.onHold => 1,
    ProjectStatus.notStarted => 2,
    ProjectStatus.completed => 3,
  };

  List<ProjectEntity> _visibleProjects() {
    final sorted = [...data.projects]
      ..sort((a, b) {
        final byStatus = _statusPriority(a.status)
            .compareTo(_statusPriority(b.status));
        if (byStatus != 0) return byStatus;
        return b.progressPercent.compareTo(a.progressPercent);
      });

    final selected = selectedStatus;
    if (selected == null) return sorted;
    return sorted
        .where((project) => project.status == selected)
        .toList(growable: false);
  }

  Map<ProjectStatus, int> _countsByStatus() => {
    for (final status in ProjectStatus.values)
      status: data.projects.where((project) => project.status == status).length,
  };

  @override
  Widget build(BuildContext context) {
    final projects = _visibleProjects();
    final total = data.total;
    final selected = selectedStatus;

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
              selected: selected,
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
              selected == null
                  ? '$total proyek'
                  : '${projects.length} dari $total proyek · ${selected.label}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface
                    .withValues(alpha: 0.55),
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
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
      ],
    );
  }
}
