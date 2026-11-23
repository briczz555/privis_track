# Drift schema v2 → v3

- **Tanggal:** 23 November 2026
- **Alasan:** meeting milik user dicerminkan ke kalender bawaan perangkat agar
  pengingatnya dipegang sistem (tetap berbunyi walau aplikasi di-force-stop).
  Dibutuhkan pemetaan meeting → event supaya tidak membuat duplikat dan agar
  event bisa diperbarui/dihapus saat meeting berubah atau dibatalkan.
- **Perubahan:** menambah table `calendar_event_links`
  (`meeting_id` primary key, `event_id`, `updated_at`).
- **Migrasi data:** tidak ada data lama yang diubah; table baru dibuat kosong.
- **Catatan:** jika pengguna menghapus event langsung dari aplikasi kalender,
  tautan dibersihkan saat sinkronisasi berikutnya (event berstatus not found)
  lalu event dibuat ulang.
