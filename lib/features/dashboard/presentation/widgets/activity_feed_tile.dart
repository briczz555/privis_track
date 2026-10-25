import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/activity_entity.dart';

/// Satu baris log aktivitas tim (mis. "Finance mengunggah BAST 1").
class ActivityFeedTile extends StatelessWidget {
  const ActivityFeedTile({
    super.key,
    required this.activity,
    this.showDivider = true,
  });

  final ActivityEntity activity;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final accent = _divisionAccent(activity.division);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Icon(
                  _divisionIcon(activity.division),
                  size: 18,
                  color: accent,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: activity.actor,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' ${activity.action} ',
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: activity.target,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            activity.projectName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: secondaryText,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          formatRelativeTime(activity.occurredAt),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(height: 1, indent: 64, endIndent: 16),
      ],
    );
  }
}

Color _divisionAccent(String division) => switch (division.toLowerCase()) {
  'finance' => AppColors.success,
  'qa' => AppColors.info,
  'developer' => AppColors.primary,
  'pm' => AppColors.warning,
  _ => AppColors.primary,
};

IconData _divisionIcon(String division) => switch (division.toLowerCase()) {
  'finance' => Icons.receipt_long_rounded,
  'qa' => Icons.fact_check_rounded,
  'developer' => Icons.terminal_rounded,
  'pm' => Icons.assignment_ind_rounded,
  _ => Icons.notifications_rounded,
};
