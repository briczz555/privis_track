import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/extensions/project_status_style.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../../core/widgets/offline_banner.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../project_management/presentation/project_form_launcher.dart';
import '../../domain/entities/project_stage_entity.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../providers/project_tracking_provider.dart';
import '../widgets/client_contact_card.dart';
import '../widgets/document_vault_sheet.dart';
import '../widgets/project_summary_card.dart';
import '../widgets/stage_timeline_tile.dart';

class ProjectTrackingScreen extends ConsumerStatefulWidget {
  const ProjectTrackingScreen({super.key, required this.projectCode});

  final String projectCode;

  @override
  ConsumerState<ProjectTrackingScreen> createState() =>
      _ProjectTrackingScreenState();
}

class _ProjectTrackingScreenState extends ConsumerState<ProjectTrackingScreen> {
  int? _updatingStageId;
  bool _isUpdatingProject = false;

  Future<void> _refresh() {
    return ref
        .read(projectTrackingProvider(widget.projectCode).notifier)
        .refresh();
  }

  Future<void> _toggleStage(ProjectStageEntity stage) async {
    if (_updatingStageId != null) return;

    final messenger = ScaffoldMessenger.of(context);
    setState(() => _updatingStageId = stage.id);

    try {
      await ref
          .read(projectTrackingProvider(widget.projectCode).notifier)
          .updateStage(stageId: stage.id, isCompleted: !stage.isCompleted);

      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            stage.isCompleted
                ? 'Tahap ${stage.title} dibuka kembali.'
                : 'Tahap ${stage.title} ditandai selesai.',
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text(readableErrorMessage(error))),
      );
    } finally {
      if (mounted) setState(() => _updatingStageId = null);
    }
  }

  Future<void> _updateProjectStatus(ProjectStatus status) async {
    if (_isUpdatingProject) return;

    final messenger = ScaffoldMessenger.of(context);
    setState(() => _isUpdatingProject = true);

    try {
      await ref
          .read(projectTrackingProvider(widget.projectCode).notifier)
          .updateProjectStatus(status);

      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text('Status proyek diubah menjadi ${status.label}.'),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text(readableErrorMessage(error))),
      );
    } finally {
      if (mounted) setState(() => _isUpdatingProject = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final projectState = ref.watch(projectTrackingProvider(widget.projectCode));
    final project = projectState.value;
    final theme = Theme.of(context);
    final userRole = ref.watch(authControllerProvider).value?.user.role;
    final canEdit = userRole == AuthRole.admin || userRole == AuthRole.pm;

    ref.listen(projectTrackingProvider(widget.projectCode), (previous, next) {
      if (next.hasValue && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(readableErrorMessage(next.error!))),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Project Tracking'),
            Text(
              widget.projectCode,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
        actions: [
          if (canEdit && project != null)
            IconButton(
              tooltip: 'Edit proyek',
              onPressed: () => startEditProject(context, ref, project),
              icon: const Icon(Icons.edit_outlined),
            ),
          if (canEdit)
            PopupMenuButton<ProjectStatus>(
              tooltip: 'Ubah status proyek',
              enabled: !_isUpdatingProject && project != null,
              onSelected: _updateProjectStatus,
              itemBuilder: (context) => [
                for (final status in ProjectStatus.values)
                  PopupMenuItem<ProjectStatus>(
                    value: status,
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: status.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(status.label),
                      ],
                    ),
                  ),
              ],
              icon: _isUpdatingProject
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.flag_outlined),
            ),
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: _refresh,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: project != null
            ? _ProjectTrackingContent(
                project: project,
                canEdit: canEdit,
                updatingStageId: _updatingStageId,
                onToggleStage: _toggleStage,
              )
            : projectState.hasError
            ? AppErrorState(
                title: isOfflineError(projectState.error)
                    ? 'Tidak ada koneksi'
                    : 'Gagal memuat project tracking',
                message: isOfflineError(projectState.error)
                    ? 'Belum ada data luring untuk proyek ini. '
                          'Buka sekali saat online agar tersimpan.'
                    : readableErrorMessage(projectState.error!),
                onRetry: _refresh,
              )
            : const AppLoadingState(message: 'Memuat timeline proyek...'),
      ),
    );
  }
}

class _ProjectTrackingContent extends StatelessWidget {
  const _ProjectTrackingContent({
    required this.project,
    required this.canEdit,
    required this.updatingStageId,
    required this.onToggleStage,
  });

  final ProjectTrackingEntity project;
  final bool canEdit;
  final int? updatingStageId;
  final ValueChanged<ProjectStageEntity> onToggleStage;

  void _openDocumentVault(BuildContext context, ProjectStageEntity stage) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) =>
          DocumentVaultSheet(projectCode: project.code, stageId: stage.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        if (project.isFromCache)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                0,
              ),
              child: OfflineBanner(cachedAt: project.cachedAt),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              0,
            ),
            child: ProjectSummaryCard(project: project),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              0,
            ),
            child: ClientContactCard(client: project.client),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: SectionHeader(
              title: 'Timeline SDLC',
              trailing: '${project.stages.length} tahap',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverList.builder(
            itemCount: project.stages.length,
            itemBuilder: (context, index) {
              final stage = project.stages[index];
              return StageTimelineTile(
                stage: stage,
                isCurrent: project.isCurrentStage(stage),
                isFirst: index == 0,
                isLast: index == project.stages.length - 1,
                canEdit: canEdit,
                isUpdating: updatingStageId == stage.id,
                onToggleCompleted: () => onToggleStage(stage),
                onTap: () => _openDocumentVault(context, stage),
              );
            },
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
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 18,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        'Tidak ada validasi urutan: semua tahap bisa dibuka '
                        'kapan saja untuk kebutuhan arsip internal.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
      ],
    );
  }
}
