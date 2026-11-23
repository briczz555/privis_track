import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/wib_time.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../meeting_calendar/domain/entities/meeting_entity.dart';
import '../../../meeting_calendar/presentation/providers/meeting_provider.dart';

/// Ringkasan meeting hari ini (WIB) untuk dashboard.
///
/// Memakai API kalender yang sudah ada, jadi tidak perlu endpoint baru dan
/// hak aksesnya sama: semua user terautentikasi boleh melihat semua meeting.
class TodayMeetingsSection extends ConsumerWidget {
  const TodayMeetingsSection({super.key});

  /// Sisanya bisa dilihat lewat halaman kalender.
  static const _maxVisible = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetings = ref.watch(meetingsProvider(_todayQueryKey()));
    final today = (meetings.value ?? const <MeetingEntity>[])
        .where((meeting) => !meeting.isCancelled)
        .toList(growable: false);
    final visible = today.take(_maxVisible).toList(growable: false);
    final remaining = today.length - visible.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Meeting Hari Ini',
          trailing: 'Kalender',
          onTrailingTap: () => context.pushNamed(AppRoutes.calendar),
        ),
        const SizedBox(height: AppSpacing.md),
        if (meetings.isLoading && !meetings.hasValue)
          const _StatusCard(
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: AppSpacing.sm),
                Text('Memuat jadwal meeting...'),
              ],
            ),
          )
        else if (meetings.hasError && !meetings.hasValue)
          _StatusCard(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Jadwal meeting tidak dapat dimuat.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                          .withValues(alpha: 0.6),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => ref.invalidate(meetingsProvider),
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          )
        else if (today.isEmpty)
          const AppEmptyState(
            message: 'Tidak ada meeting hari ini.',
            icon: Icons.event_available_rounded,
          )
        else
          Card(
            child: Column(
              children: [
                for (var index = 0; index < visible.length; index++) ...[
                  if (index > 0) const Divider(height: 1),
                  _MeetingRow(
                    meeting: visible[index],
                    onTap: () => _openMeeting(context, ref, visible[index]),
                  ),
                ],
                if (remaining > 0) ...[
                  const Divider(height: 1),
                  InkWell(
                    onTap: () => context.pushNamed(AppRoutes.calendar),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '$remaining meeting lainnya',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 16,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Future<void> _openMeeting(
    BuildContext context,
    WidgetRef ref,
    MeetingEntity meeting,
  ) async {
    await context.pushNamed(
      AppRoutes.meetingDetail,
      pathParameters: {'meetingId': meeting.id},
      extra: meeting,
    );
    ref.invalidate(meetingsProvider);
  }
}

class _MeetingRow extends StatelessWidget {
  const _MeetingRow({required this.meeting, required this.onTap});

  final MeetingEntity meeting;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final start = toWib(meeting.startAt);
    final end = toWib(meeting.endAt);
    final accent = meeting.isOnline ? AppColors.info : AppColors.warning;
    final subtitle = meeting.project != null
        ? '${meeting.project!.code} · ${meeting.project!.name}'
        : meeting.client?.name ?? (meeting.isOnline ? 'Online' : 'Onsite');

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 46,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _time(start),
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _time(end),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 3,
              height: 34,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meeting.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Icon(
                        meeting.isOnline
                            ? Icons.videocam_outlined
                            : Icons.location_on_outlined,
                        size: 12,
                        color: secondaryText,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Icon(Icons.chevron_right_rounded, size: 18, color: secondaryText),
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: child,
      ),
    );
  }
}

/// Key `meetingsProvider`: rentang hari ini 00.00–24.00 WIB.
String _todayQueryKey() {
  final today = todayWib();
  final from = wibWallClockToUtc(today);
  final to = wibWallClockToUtc(today.add(const Duration(days: 1)));

  return '${from.toIso8601String()}|${to.toIso8601String()}|all|';
}

String _time(DateTime date) =>
    '${date.hour.toString().padLeft(2, '0')}:'
    '${date.minute.toString().padLeft(2, '0')}';
