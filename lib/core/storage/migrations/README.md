# core/storage/migrations/

Folder ini untuk dokumentasi/catatan tiap step migrasi schema Drift (misal
`v1_to_v2.md` menjelaskan perubahan apa dan kenapa), sebagai pendamping kode
migrasi aktual yang ditulis di `MigrationStrategy.onUpgrade` pada
`core/storage/database.dart`.

Konvensi penamaan: `v<from>_to_v<to>.md`, contoh: `v1_to_v2.md`.

Isi tiap file minimal:
- Tanggal & alasan perubahan
- Table/kolom yang ditambah/diubah/dihapus
- Apakah perlu migrasi data (bukan cuma schema)
