# core/storage/tables/

Semua definisi `Table` Drift dari seluruh fitur ditaruh di sini (bukan di dalam
folder fitur masing-masing), supaya:

- Satu sumber kebenaran untuk schema database.
- `schemaVersion` dan migration di `database.dart` gampang dikelola dari satu tempat.

Contoh nama file: `product_list_table.dart`, `auth_table.dart`.

Setelah menambah table baru:
1. Import table tersebut di `core/storage/database.dart`.
2. Tambahkan ke list `@DriftDatabase(tables: [...])`.
3. Naikkan `schemaVersion` dan tambahkan step di `migration.onUpgrade`.
4. Jalankan `dart run build_runner build --delete-conflicting-outputs`.
