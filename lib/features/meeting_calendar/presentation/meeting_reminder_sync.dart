import '../../../core/notifications/meeting_reminder_service.dart';
import '../../../core/utils/wib_time.dart';
import '../domain/entities/meeting_entity.dart';

/// Jarak pengingat sebelum meeting dimulai.
const meetingReminderLeadTime = Duration(minutes: 30);

/// Memetakan meeting menjadi pengingat lokal.
///
/// Hanya meeting yang belum dibatalkan dan masih lebih dari
/// [meetingReminderLeadTime] lagi yang dipakai.
List<MeetingReminder> buildMeetingReminders(List<MeetingEntity> meetings) {
  final cutoff = DateTime.now().add(meetingReminderLeadTime);

  return [
    for (final meeting in meetings)
      if (!meeting.isCancelled && meeting.startAt.isAfter(cutoff))
        MeetingReminder(
          meetingId: meeting.id,
          title: 'Meeting 30 menit lagi',
          body: _body(meeting),
          scheduledAt: meeting.startAt.subtract(meetingReminderLeadTime),
        ),
  ];
}

/// Menyinkronkan pengingat untuk seluruh meeting pada rentang yang dimuat.
Future<void> syncMeetingReminders(List<MeetingEntity> meetings) {
  return MeetingReminderService.instance.sync(buildMeetingReminders(meetings));
}

String _body(MeetingEntity meeting) {
  final start = toWib(meeting.startAt);
  final end = toWib(meeting.endAt);
  final project = meeting.project;
  final projectSuffix = project == null ? '' : ' · ${project.code}';

  return '${_time(start)}–${_time(end)} WIB · ${meeting.title}$projectSuffix';
}

String _time(DateTime date) =>
    '${date.hour.toString().padLeft(2, '0')}:'
    '${date.minute.toString().padLeft(2, '0')}';
