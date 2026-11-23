import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'database.dart';

part 'calendar_event_link_store.g.dart';

/// Menyimpan pasangan meeting → event kalender perangkat.
abstract interface class CalendarEventLinkStore {
  Future<Map<String, String>> load();

  Future<void> save(String meetingId, String eventId);

  Future<void> remove(String meetingId);
}

@Riverpod(keepAlive: true)
CalendarEventLinkStore calendarEventLinkStore(Ref ref) {
  return DriftCalendarEventLinkStore(ref.watch(appDatabaseProvider));
}

class DriftCalendarEventLinkStore implements CalendarEventLinkStore {
  DriftCalendarEventLinkStore(this._db);

  final AppDatabase _db;

  @override
  Future<Map<String, String>> load() async {
    final rows = await _db.select(_db.calendarEventLinks).get();
    return {for (final row in rows) row.meetingId: row.eventId};
  }

  @override
  Future<void> save(String meetingId, String eventId) {
    return _db
        .into(_db.calendarEventLinks)
        .insertOnConflictUpdate(
          CalendarEventLinksCompanion.insert(
            meetingId: meetingId,
            eventId: eventId,
            updatedAt: DateTime.now(),
          ),
        );
  }

  @override
  Future<void> remove(String meetingId) {
    return (_db.delete(_db.calendarEventLinks)
          ..where((row) => row.meetingId.equals(meetingId)))
        .go();
  }
}
