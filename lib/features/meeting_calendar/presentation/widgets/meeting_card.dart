import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/wib_time.dart';
import '../../../user_management/presentation/widgets/user_role_style.dart';
import '../../domain/entities/meeting_entity.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({super.key, required this.meeting, required this.onTap});

  final MeetingEntity meeting;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final cancelled = meeting.isCancelled;
    final accent = cancelled
        ? AppColors.textSecondary
        : meeting.isOnline
        ? AppColors.info
        : AppColors.warning;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(
                      meeting.isOnline ? 'Online' : 'Onsite',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: accent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    '${_time(meeting.startAt)}–${_time(meeting.endAt)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: secondaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (cancelled)
                    Text(
                      'Dibatalkan',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                meeting.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  decoration: cancelled ? TextDecoration.lineThrough : null,
                ),
              ),
              if (meeting.project != null) ...[
                const SizedBox(height: 2),
                Text(
                  '${meeting.project!.code} · ${meeting.project!.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: secondaryText,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  for (final participant in meeting.participants.take(3))
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: participant.role.color.withValues(
                          alpha: 0.15,
                        ),
                        child: Text(
                          _initials(participant.name),
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 8,
                            color: participant.role.color,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  if (meeting.participants.length > 3)
                    Text(
                      '+${meeting.participants.length - 3}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: secondaryText,
                      ),
                    ),
                  const Spacer(),
                  Icon(
                    Icons.people_outline_rounded,
                    size: 14,
                    color: secondaryText,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '${meeting.participants.length}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _time(DateTime date) {
  final local = toWib(date);
  return '${local.hour.toString().padLeft(2, '0')}:'
      '${local.minute.toString().padLeft(2, '0')}';
}

String _initials(String name) {
  final words = name.trim().split(RegExp(r'\s+'));
  if (words.isEmpty) return '?';
  return words.take(2).map((word) => word[0].toUpperCase()).join();
}
