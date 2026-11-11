# Drift schema v1 → v2

- **Tanggal:** 12 November 2026
- **Alasan:** menyelesaikan Fase 2 — cache offline data baca.
- **Perubahan:** menambah table `cache_snapshots` (`cache_key` primary key,
  `payload` JSON, `updated_at`).
- **Migrasi data:** tidak ada data lama yang perlu diubah; table baru dibuat
  kosong dan akan terisi saat request online berikutnya.
- **Catatan:** cache hanya untuk data baca. Tidak ada antrean aksi tulis offline;
  cache dibersihkan saat login/logout untuk mencegah data lintas akun.
