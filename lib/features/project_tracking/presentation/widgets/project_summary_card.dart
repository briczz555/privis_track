import 'package:flutter/material.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/extensions/project_status_style.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/project_status_chip.dart';
import '../../domain/entities/project_tracking_entity.dart';

/// Ringkasan proyek di atas timeline: identitas, status, dan progres tahap.
class ProjectSummaryCard extends StatelessWidget {
  const ProjectSummaryCard({super.key, required this.project});

  final ProjectTrackingEntity project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.6);
    final currentStage = project.stageById(project.currentStage);
    final stageLabel = project.status == ProjectStatus.notStarted
        ? 'Belum dimulai'
        : 'Tahap ${project.currentStage} dari '
              '${ProjectTrackingEntity.totalStages} · '
              '${currentStage?.title ?? '-'}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProjectMark(name: project.name),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        project.client,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                ProjectStatusChip(status: project.status),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Text(
                  'Progres tahap',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: secondaryText,
                  ),
                ),
                const Spacer(),
                Text(
                  '${project.progressPercent}%',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: project.status.color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            LinearProgressIndicator(
              value: project.progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              stageLabel,
              style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
            ),
            const Divider(height: AppSpacing.lg + AppSpacing.xs),
            Row(
              children: [
                _MetaItem(
                  icon: Icons.folder_copy_outlined,
                  label: '${project.totalDocuments} dokumen',
                ),
                const SizedBox(width: AppSpacing.md),
                _MetaItem(
                  icon: Icons.view_timeline_outlined,
                  label: '${project.stages.length} tahap SDLC',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectMark extends StatelessWidget {
  const _ProjectMark({required this.name});

  final String name;

  String get _initials {
    final words = name
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .take(2)
        .toList(growable: false);
    return words.map((word) => word[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.info],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Text(
        _initials,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: secondaryText),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
        ),
      ],
    );
  }
}
