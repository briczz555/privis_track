import 'dart:convert';

// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/exceptions/network_exception.dart';
import 'database.dart';

part 'cache_store.g.dart';

/// Snapshot JSON yang tersimpan di perangkat.
class CachedSnapshot {
  const CachedSnapshot({required this.payload, required this.updatedAt});

  final String payload;
  final DateTime updatedAt;
}

/// Abstraksi cache snapshot agar repository data tidak bergantung langsung
/// pada Drift dan mudah diganti fake saat test.
abstract interface class SnapshotCache {
  Future<CachedSnapshot?> read(String key);

  Future<void> write({
    required String key,
    required String payload,
    DateTime? updatedAt,
  });

  Future<void> clear();
}

@Riverpod(keepAlive: true)
SnapshotCache cacheStore(Ref ref) {
  return DriftSnapshotCache(ref.watch(appDatabaseProvider));
}

class DriftSnapshotCache implements SnapshotCache {
  DriftSnapshotCache(this._db);

  final AppDatabase _db;

  @override
  Future<CachedSnapshot?> read(String key) async {
    final row = await (_db.select(
      _db.cacheSnapshots,
    )..where((table) => table.cacheKey.equals(key))).getSingleOrNull();

    if (row == null) return null;
    return CachedSnapshot(payload: row.payload, updatedAt: row.updatedAt);
  }

  @override
  Future<void> write({
    required String key,
    required String payload,
    DateTime? updatedAt,
  }) async {
    await _db
        .into(_db.cacheSnapshots)
        .insertOnConflictUpdate(
          CacheSnapshotsCompanion.insert(
            cacheKey: key,
            payload: payload,
            updatedAt: updatedAt ?? DateTime.now(),
          ),
        );
  }

  @override
  Future<void> clear() => _db.delete(_db.cacheSnapshots).go();
}

/// Hanya gangguan koneksi/timeout yang boleh memakai data cache. Error
/// autentikasi, izin, atau validasi tetap diteruskan ke UI.
bool isOfflineFailure(NetworkException error) =>
    error is NoConnectionException || error is TimeoutNetworkException;

Map<String, dynamic> decodeCachedPayload(String payload) =>
    Map<String, dynamic>.from(jsonDecode(payload) as Map);
