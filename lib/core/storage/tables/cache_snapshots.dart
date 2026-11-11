import 'package:drift/drift.dart';

/// Snapshot JSON per fitur untuk fallback saat perangkat offline.
///
/// Hanya data baca yang disimpan; tidak ada antrean aksi tulis.
class CacheSnapshots extends Table {
  TextColumn get cacheKey => text()();
  TextColumn get payload => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {cacheKey};
}
