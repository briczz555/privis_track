import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/utils/wib_time.dart';
import 'package:privis_track/features/meeting_calendar/domain/entities/meeting_status.dart';
import 'package:privis_track/features/meeting_calendar/presentation/meeting_reminder_sync.dart';

import 'support/fixtures.dart';

String _two(int value) => value.toString().padLeft(2, '0');

void main() {
  group('buildMeetingReminders', () {
    test('membuat pengingat 30 menit sebelum meeting', () {
      final start = DateTime.now().toUtc().add(const Duration(hours: 2));
      final meeting = testMeeting.copyWith(
        startAt: start,
        endAt: start.add(const Duration(hours: 1)),
      );

      final reminders = buildMeetingReminders([meeting]);

      expect(reminders, hasLength(1));
      expect(reminders.single.meetingId, testMeeting.id);
      expect(reminders.single.title, 'Meeting 30 menit lagi');
      expect(
        reminders.single.scheduledAt,
        start.subtract(const Duration(minutes: 30)),
      );
    });

    test('isi notifikasi memakai jam WIB dan kode proyek', () {
      final start = wibWallClockToUtc(
        DateTime.now().add(const Duration(days: 1)),
      ).add(const Duration(hours: 2));
      final wibStart = toWib(start);
      final wibEnd = toWib(start.add(const Duration(hours: 1)));

      final reminders = buildMeetingReminders([
        testMeeting.copyWith(
          startAt: start,
          endAt: start.add(const Duration(hours: 1)),
        ),
      ]);

      expect(reminders, hasLength(1));
      expect(
        reminders.single.body,
        '${_two(wibStart.hour)}:${_two(wibStart.minute)}'
        '–${_two(wibEnd.hour)}:${_two(wibEnd.minute)} WIB'
        ' · Meeting Mingguan · PRJ-001',
      );
    });

    test('meeting yang dibatalkan tidak dijadwalkan', () {
      final meeting = testMeeting.copyWith(
        startAt: DateTime.now().toUtc().add(const Duration(hours: 3)),
        status: MeetingStatus.cancelled,
      );

      expect(buildMeetingReminders([meeting]), isEmpty);
    });

    test('meeting yang tinggal kurang dari 30 menit tidak dijadwalkan', () {
      final start = DateTime.now().toUtc().add(const Duration(minutes: 10));
      final meeting = testMeeting.copyWith(
        startAt: start,
        endAt: start.add(const Duration(hours: 1)),
      );

      expect(buildMeetingReminders([meeting]), isEmpty);
    });

    test('meeting yang sudah lewat tidak dijadwalkan', () {
      final start = DateTime.now().toUtc().subtract(const Duration(hours: 1));
      final meeting = testMeeting.copyWith(
        startAt: start,
        endAt: start.add(const Duration(hours: 1)),
      );

      expect(buildMeetingReminders([meeting]), isEmpty);
    });
  });
}
