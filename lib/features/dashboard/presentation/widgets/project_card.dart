import 'package:flutter/material.dart';

import '../../../../core/extensions/project_status_style.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/project_status_chip.dart';
import '../../domain/entities/project_entity.dart';

/// Kartu proyek (dipakai di list proyek berjalan maupun halaman semua proyek).
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.onTap});

  final ProjectEntity project;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.6);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Di layar sempit, badge status dipindah ke baris sendiri agar
              // nama proyek tidak terpotong terlalu pendek.
              final isCompact = constraints.maxWidth < 310;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProjectAvatar(seed: project.name),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium,
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
                      if (!isCompact) ...[
                        const SizedBox(width: AppSpacing.sm),
                        ProjectStatusChip(status: project.status),
                      ],
                    ],
                  ),
                  if (isCompact) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Padding(
                      padding: const EdgeInsets.only(left: 56),
                      child: ProjectStatusChip(status: project.status),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Icon(
                        Icons.alt_route_rounded,
                        size: 14,
                        color: secondaryText,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${project.currentStageTitle} · Tahap '
                          '${project.currentStage}/${ProjectEntity.totalStages}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: secondaryText,
                          ),
                        ),
                      ),
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
                    minHeight: 6,
                    color: project.status.color,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      _MetaItem(
                        icon: Icons.folder_copy_outlined,
                        label: '${project.documentCount} dokumen',
                      ),
                      if (project.dueDate != null) ...[
                        const SizedBox(width: AppSpacing.md),
                        _MetaItem(
                          icon: Icons.event_outlined,
                          label: 'Target ${formatShortDate(project.dueDate!)}',
                        ),
                      ],
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProjectAvatar extends StatelessWidget {
  const _ProjectAvatar({required this.seed});

  final String seed;

  static const _palette = [
    AppColors.primary,
    AppColors.secondary,
    AppColors.info,
    AppColors.warning,
  ];

  Color get _accent {
    final sum = seed.codeUnits.fold<int>(0, (total, unit) => total + unit);
    return _palette[sum % _palette.length];
  }

  String get _initials {
    final words = seed
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .take(2)
        .toList(growable: false);
    return words.map((word) => word[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Text(
        _initials,
        style: Theme.of(context).textTheme.labelLarge
            ?.copyWith(color: _accent, fontWeight: FontWeight.w700),
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
        Icon(icon, size: 13, color: secondaryText),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
        ),
      ],
    );
  }
}
