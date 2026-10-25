import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/project_stage_entity.dart';

/// Satu baris timeline SDLC vertikal. Semua tahap selalu bisa di-tap
/// (tidak ada step-lock) untuk membuka document vault.
class StageTimelineTile extends StatelessWidget {
  const StageTimelineTile({
    super.key,
    required this.stage,
    required this.isCurrent,
    required this.isFirst,
    required this.isLast,
    required this.onTap,
  });

  final ProjectStageEntity stage;
  final bool isCurrent;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final isCompleted = stage.isCompleted;
    final accent = isCompleted
        ? AppColors.success
        : isCurrent
        ? AppColors.primary
        : secondaryText;

    final meta = switch ((isCompleted, isCurrent)) {
      (true, _) =>
        '${stage.documentCount} dokumen · Selesai '
            '${stage.completedAt == null ? '-' : formatDayMonth(stage.completedAt!)}',
      (false, true) => '${stage.documentCount} dokumen · Sedang berjalan',
      _ => '${stage.documentCount} dokumen · Belum dimulai',
    };

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 30,
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: 6,
                  color: isFirst
                      ? Colors.transparent
                      : isCompleted || isCurrent
                      ? accent.withValues(alpha: 0.4)
                      : theme.dividerColor,
                ),
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted || isCurrent
                        ? accent
                        : theme.colorScheme.surface,
                    border: Border.all(
                      color: isCompleted || isCurrent
                          ? accent
                          : theme.dividerColor,
                      width: 1.5,
                    ),
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: theme.colorScheme.onPrimary,
                        )
                      : Text(
                          '${stage.id}',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: isCurrent
                                ? theme.colorScheme.onPrimary
                                : secondaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: isLast
                        ? Colors.transparent
                        : stage.isCompleted
                        ? AppColors.success.withValues(alpha: 0.4)
                        : theme.dividerColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Material(
                color: isCurrent
                    ? AppColors.primary.withValues(alpha: 0.05)
                    : theme.cardTheme.color ?? theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      border: Border.all(
                        color: isCurrent
                            ? AppColors.primary.withValues(alpha: 0.4)
                            : theme.dividerColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stage.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                meta,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isCurrent ? accent : secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 20,
                          color: secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
