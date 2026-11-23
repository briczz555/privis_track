import 'package:drift/drift.dart';

/// Pemetaan meeting ke event di kalender bawaan perangkat.
///
/// Dipakai agar sinkronisasi tidak membuat event duplikat saat kalender
/// dimuat berulang kali, dan agar event bisa diperbarui/dihapus ketika
/// meeting berubah atau dibatalkan.
class CalendarEventLinks extends Table {
  TextColumn get meetingId => text()();
  TextColumn get eventId => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {meetingId};
}
