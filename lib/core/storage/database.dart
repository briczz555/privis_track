import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import table tiap fitur di sini seiring bertambahnya fitur, contoh:
// import 'tables/product_list_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    // Daftarkan table di sini, contoh:
    // ProductListTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Naikkan angka ini setiap kali ada perubahan schema (table baru, kolom
  /// baru, dsb), lalu tambahkan step migrasinya di [migration] dan
  /// dokumentasikan di core/storage/migrations/.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // Contoh pola migration bertahap:
        // if (from < 2) {
        //   await m.addColumn(productListTable, productListTable.someNewColumn);
        // }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

/// Instance AppDatabase tunggal untuk seluruh aplikasi.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}
