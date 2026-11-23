import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/features/meeting_calendar/domain/entities/meeting_mode.dart';
import 'package:privis_track/features/meeting_calendar/domain/entities/meeting_status.dart';
import 'package:privis_track/features/meeting_calendar/presentation/meeting_calendar_sync.dart';

import 'support/fixtures.dart';

void main() {
  group('buildDeviceCalendarEvents', () {
    test('menyertakan meeting saat user adalah peserta', () {
      final events = buildDeviceCalendarEvents(
        meetings: [testMeeting],
        userId: testMeetingParticipants.last.id,
      );

      expect(events, hasLength(1));
      expect(events.single.meetingId, testMeeting.id);
      expect(events.single.title, 'Meeting Mingguan · PRJ-001');
      expect(events.single.location, 'Online');
      expect(events.single.startAt, testMeeting.startAt.toLocal());
      expect(events.single.endAt, testMeeting.endAt.toLocal());
      expect(events.single.isCancelled, isFalse);
    });

    test('menyertakan meeting saat user adalah organizer', () {
      final events = buildDeviceCalendarEvents(
        meetings: [testMeeting],
        userId: testMeeting.organizer.id,
      );

      expect(events, hasLength(1));
    });

    test('melewati meeting yang tidak melibatkan user', () {
      final events = buildDeviceCalendarEvents(
        meetings: [testMeeting],
        userId: 'user-lain',
      );

      expect(events, isEmpty);
    });

    test('meeting batal tetap dibawa agar event kalender dihapus', () {
      final events = buildDeviceCalendarEvents(
        meetings: [testMeeting.copyWith(status: MeetingStatus.cancelled)],
        userId: testMeeting.organizer.id,
      );

      expect(events, hasLength(1));
      expect(events.single.isCancelled, isTrue);
    });

    test('deskripsi memuat agenda, catatan, dan link meeting', () {
      final meeting = testMeeting.copyWith(
        agenda: 'Review progres',
        notes: 'Klien minta demo',
      );

      final event = buildDeviceCalendarEvents(
        meetings: [meeting],
        userId: testMeeting.organizer.id,
      ).single;

      expect(event.description, contains('Agenda:\nReview progres'));
      expect(event.description, contains('Catatan:\nKlien minta demo'));
      expect(
        event.description,
        contains('Link: https://meet.google.com/uji'),
      );
      expect(event.description, contains('PriVis Track'));
    });

    test('meeting onsite memakai lokasi manual', () {
      final meeting = testMeeting.copyWith(
        mode: MeetingMode.onsite,
        location: 'Kantor Klien, Jakarta',
        meetingUrl: null,
      );

      final event = buildDeviceCalendarEvents(
        meetings: [meeting],
        userId: testMeeting.organizer.id,
      ).single;

      expect(event.location, 'Kantor Klien, Jakarta');
      expect(event.description, isNot(contains('Link:')));
    });

    test('tanpa agenda/catatan/link memakai deskripsi bawaan', () {
      final meeting = testMeeting.copyWith(
        agenda: null,
        notes: null,
        mode: MeetingMode.onsite,
        meetingUrl: null,
        location: 'Kantor',
      );

      final event = buildDeviceCalendarEvents(
        meetings: [meeting],
        userId: testMeeting.organizer.id,
      ).single;

      expect(event.description, 'Dibuat otomatis dari PriVis Track.');
    });
  });
}
