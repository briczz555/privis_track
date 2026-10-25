import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/project_stage_entity.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../providers/project_tracking_provider.dart';
import '../widgets/document_vault_sheet.dart';
import '../widgets/project_summary_card.dart';
import '../widgets/stage_timeline_tile.dart';

class ProjectTrackingScreen extends ConsumerWidget {
  const ProjectTrackingScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectTrackingProvider(projectId));
    final project = projectState.value;
    final theme = Theme.of(context);

    // Saat reload gagal, data lama tetap tampil — beri tahu user lewat SnackBar.
    ref.listen(projectTrackingProvider(projectId), (previous, next) {
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
              projectId,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: () => ref.invalidate(projectTrackingProvider(projectId)),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: project != null
            ? _ProjectTrackingContent(project: project)
            : projectState.hasError
            ? AppErrorState(
                title: 'Gagal memuat project tracking',
                message: readableErrorMessage(projectState.error!),
                onRetry: () =>
                    ref.invalidate(projectTrackingProvider(projectId)),
              )
            : const AppLoadingState(message: 'Memuat timeline proyek...'),
      ),
    );
  }
}

class _ProjectTrackingContent extends StatelessWidget {
  const _ProjectTrackingContent({required this.project});

  final ProjectTrackingEntity project;

  void _openDocumentVault(BuildContext context, ProjectStageEntity stage) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) =>
          DocumentVaultSheet(projectId: project.id, stageId: stage.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
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
