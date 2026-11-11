import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:privis_track/core/storage/cache_store.dart';
import 'package:privis_track/core/storage/database.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('cache Drift menyimpan, membaca, dan membersihkan snapshot', (
    tester,
  ) async {
    final db = AppDatabase();
    final cache = DriftSnapshotCache(db);

    await cache.write(key: 'uji-offline', payload: '{"nilai":1}');
    final snapshot = await cache.read('uji-offline');

    expect(snapshot, isNotNull);
    expect(snapshot!.payload, '{"nilai":1}');
    expect(snapshot.updatedAt, isA<DateTime>());

    await cache.clear();
    expect(await cache.read('uji-offline'), isNull);

    await db.close();
  });
}
