import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/calendar/device_calendar_sync.dart';
import '../../auth/presentation/providers/auth_controller.dart';
import '../domain/entities/meeting_entity.dart';

/// Meeting yang relevan untuk user (organizer atau peserta) dicerminkan ke
/// kalender bawaan perangkat, lengkap dengan pengingat 30 menit.
List<DeviceCalendarEvent> buildDeviceCalendarEvents({
  required List<MeetingEntity> meetings,
  required String userId,
}) {
  return [
    for (final meeting in meetings)
      if (meeting.organizer.id == userId ||
          meeting.participants.any((participant) => participant.id == userId))
        DeviceCalendarEvent(
          meetingId: meeting.id,
          title: meeting.project == null
              ? meeting.title
              : '${meeting.title} · ${meeting.project!.code}',
          description: _description(meeting),
          location: meeting.isOnline ? 'Online' : meeting.location,
          startAt: meeting.startAt.toLocal(),
          endAt: meeting.endAt.toLocal(),
          isCancelled: meeting.isCancelled,
        ),
  ];
}

/// Menyinkronkan seluruh meeting pada rentang yang dimuat ke kalender HP.
Future<void> syncMeetingsToDeviceCalendar({
  required WidgetRef ref,
  required List<MeetingEntity> meetings,
}) async {
  final userId = ref.read(authControllerProvider).value?.user.id;
  if (userId == null) return;

  await ref
      .read(deviceCalendarSyncProvider)
      .sync(buildDeviceCalendarEvents(meetings: meetings, userId: userId));
}

String? _description(MeetingEntity meeting) {
  final parts = <String>[
    if ((meeting.agenda ?? '').trim().isNotEmpty)
      'Agenda:\n${meeting.agenda!.trim()}',
    if ((meeting.notes ?? '').trim().isNotEmpty)
      'Catatan:\n${meeting.notes!.trim()}',
    if (meeting.isOnline && (meeting.meetingUrl ?? '').trim().isNotEmpty)
      'Link: ${meeting.meetingUrl!.trim()}',
  ];

  if (parts.isEmpty) return 'Dibuat otomatis dari PriVis Track.';
  return '${parts.join('\n\n')}\n\n— PriVis Track';
}
