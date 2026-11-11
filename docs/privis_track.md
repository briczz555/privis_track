# 📄 Product Requirements Document (PRD)

**Project Name:** PriVis Track
**Project Description:** Internal Project Tracking & Document Archive App
**Phase:** Fase 3 – Operasional & Skala (Fase 2 selesai)
**Platform:** Mobile App (Flutter / Android & iOS)
**Base Architecture:** [briczz555/flutter-clean-starter](https://github.com/briczz555/flutter-clean-starter)
**Document Status:** Approved — diperbarui 12 November 2026 (Fase 2 selesai)
**Repositori:** `privis_track` (Flutter) · `privis_track_api` (NestJS)

---

## 1. Product Overview & Vision

Aplikasi internal (*in-house tool*) yang dirancang khusus untuk tim *software house* guna melacak progres proyek klien melalui 8 tahap *Software Development Life Cycle* (SDLC).
Aplikasi ini berfungsi sebagai **pusat arsip dokumen** agar seluruh anggota tim lintas divisi (PM, Developer, Finance) memiliki transparansi status proyek secara *real-time*.

## 2. Project Scope & Phasing

### 2.1. Fase 1 — ✅ Selesai

- Inisialisasi proyek menggunakan skill `/flutter-clean-starter/start`.
- Pengembangan antarmuka (UI/UX) untuk fitur *Dashboard* dan *Project Tracking*.
- Implementasi navigasi (GoRouter), *state management* (Riverpod), dan *data modeling* (Freezed).
- Penggunaan **Dummy Data** di lapisan Data Source (Mock).

Dummy data sudah sepenuhnya diganti API nyata pada Fase 2.

### 2.2. Fase 2 — ✅ Selesai

| Item | Status |
|---|---|
| Pengembangan Backend & REST API (NestJS + Prisma + PostgreSQL + MinIO) | ✅ |
| Integrasi Dio `remote_data_source` ke API sesungguhnya | ✅ |
| Auth JWT, role, dokumen, PATCH tahap/proyek, ganti password, manajemen user | ✅ |
| Hardening backend (rate limit, Swagger, magic-bytes, akun layanan MinIO) | ✅ |
| Penyimpanan luring Drift di `core/storage/` (cache baca) | ✅ |

**Hasil Fase 2:** cache offline read-only untuk dashboard, daftar proyek, dan detail
tracking sudah aktif. Saat koneksi gagal/timeout, aplikasi menampilkan snapshot
terakhir beserta label "data luring"; error autentikasi/izin tidak memakai cache.
Cache dibersihkan saat login/logout. Antrean tulis offline (upload/PATCH) tetap
di luar cakupan.

### 2.3. Tambahan di luar PRD awal

Fitur berikut lahir dari kebutuhan operasional dan sudah diimplementasikan:

| Tambahan | Alasan |
|---|---|
| Login JWT + refresh rotation + secure storage | Aplikasi tidak boleh terbuka tanpa autentikasi |
| Upload/download/hapus dokumen ke MinIO (maks. 20 MB) | Melengkapi *document vault* agar benar-benar menjadi arsip |
| PATCH tahap & status proyek (admin/PM) | Progres harus bisa diperbarui dari aplikasi |
| Ganti password + manajemen user | Akun seed tidak boleh dipakai permanen |
| Rate limit, Swagger `/docs`, validasi magic-bytes, akun layanan MinIO | Kesiapan produksi |

### 2.4. Fase 3 — ⏳ Berikutnya

- Backup offsite otomatis (PostgreSQL + MinIO) dan monitoring uptime.
- Pagination UI untuk lebih dari 100 proyek.
- Deep-link: kembali ke halaman tujuan setelah login.
- Antivirus scan dokumen sebelum dapat diunduh.
- Audit log aksi admin (manajemen user belum masuk activity proyek).

## 3. Target Audience (User Personas)

Aplikasi ini **TIDAK** dapat diakses oleh klien. Pengguna eksklusif:

1. **Project Manager (PM):** Memantau *timeline*, mengubah status/tahap, dan mengelola dokumen.
2. **Developer & QA:** Mengakses referensi dokumen teknis dan mengunggah UAT *checklist*.
3. **Finance / Admin:** Mengunggah *invoice* dan bukti pembayaran; admin mengelola akun tim.

## 4. Core Features & Requirements

### 4.1. Dashboard (`lib/features/dashboard/`)

- **Portfolio Chart:** *Donut/Pie Chart* interaktif yang memvisualisasikan proporsi status proyek.
- **Active Projects List:** Daftar proyek berjalan dengan indikator persentase (*progress bar*).
- **Team Activity Feed:** Daftar vertikal log aktivitas terbaru (misal: "Finance uploaded BAST 1").
- **Semua Proyek** (`/projects`): daftar seluruh proyek dengan filter status.
- Data berasal dari `GET /v1/dashboard` dan `GET /v1/projects`.

### 4.2. Project Tracking (`lib/features/project_tracking/`)

- **Vertical 8-Stage Timeline UI:** Menampilkan 8 tahap SDLC secara vertikal (Discovery hingga Maintenance).
- **No Step-Lock Logic:** Semua tahap bersifat *clickable* tanpa validasi status progres (akses bebas untuk arsip internal).
- **Document Vault (Bottom Sheet):** Daftar file per tahap dengan upload, unduh, dan hapus (khusus admin/PM). Format PDF, DOC/DOCX, XLS/XLSX, CSV, PNG/JPG, FIG; maks. 20 MB.
- **Aksi progres:** admin/PM dapat menandai tahap selesai atau membuka kembali, serta mengubah status proyek. Server menghitung ulang `completed_stages`, `progress_percent`, dan `current_stage`.
- Umpan balik aksi ditampilkan inline di dalam bottom sheet agar tidak tertutup modal.

### 4.3. Auth & Akun (`lib/features/auth/`)

- Login dengan email/password, token disimpan di `flutter_secure_storage`.
- Access token 15 menit; refresh token 7 hari dengan rotasi dan pencabutan sesi.
- Restore sesi saat aplikasi dibuka, redirect guard GoRouter.
- Halaman Pengaturan: profil, ganti password, dan logout.

### 4.4. Manajemen User (`lib/features/user_management/`, admin)

- Daftar user beserta role, divisi, dan status aktif.
- Tambah user, ubah nama/role/divisi, aktif/nonaktifkan, reset password.
- Nonaktif dan reset password mencabut seluruh sesi user tersebut.
- Admin tidak dapat menonaktifkan atau menurunkan role akun sendiri; minimal satu admin aktif harus tersisa.

### 4.5. Cache Offline (`lib/core/storage/`)

- Snapshot JSON data baca disimpan di Drift (`cache_snapshots`).
- Saat jaringan gagal/timeout, tampilkan data terakhir beserta waktu pembaruan dan label "data luring".
- Hanya error koneksi/timeout yang memakai cache; error 401/403/404 tetap ditampilkan.
- Daftar proyek dihangatkan otomatis setelah dashboard berhasil dimuat, sehingga halaman Semua Proyek tetap terbuka offline. Detail proyek perlu dibuka minimal sekali saat online.
- Jika belum ada snapshot, tampil pesan "Belum ada data luring" (bukan error generik).
- Cache dibersihkan saat login/logout; tidak ada antrean aksi tulis offline.

---

## 5. Technical Specifications (Clean Architecture)

Pengembangan **wajib** mengikuti pola **Feature-first + Clean Architecture** sesuai aturan `flutter-clean-starter`. Segala pelanggaran akan diblokir oleh *hook* pengecekan struktur.

### 5.1. Tech Stack Utama

| Lapisan | Teknologi |
|---|---|
| Mobile | Flutter (Android & iOS) |
| State Management | Riverpod + Riverpod Generator (`Ref` generik) |
| Data Modeling | Freezed + JSON Serializable (`sealed class` wajib) |
| Routing | GoRouter (terpusat di `core/navigation/`) |
| Network | Dio ke API nyata, `mapDioException()` di repository |
| Local cache | Drift (snapshot baca: dashboard, proyek, tracking) |
| Backend | NestJS 12, Prisma 6, PostgreSQL 16, MinIO (S3-compatible) |
| Deployment | Docker Compose di VPS, Cloudflare Tunnel → Nginx Proxy Manager |

### 5.2. Layering Strategy per Feature

Setiap fitur harus memiliki struktur internal berikut:

```text
lib/features/<feature_name>/
├── data/
│   ├── datasources/ (<feature_name>_remote_data_source.dart) -> HTTP Dio / sumber data
│   ├── dto/         (<feature_name>_dto.dart) -> Freezed class dengan fromJson/toJson
│   ├── models/      (<feature_name>_model.dart)
│   └── repositories/(<feature_name>_repository_impl.dart)
├── domain/
│   ├── entities/    (<feature_name>_entity.dart) -> Freezed sealed class (TANPA fromJson)
│   ├── repositories/(<feature_name>_repository.dart) -> Abstract interface
│   └── usecases/    (get_<feature_name>_usecase.dart)
└── presentation/
    ├── providers/   (<feature_name>_provider.dart) -> Riverpod
    ├── screens/     (<feature_name>_screen.dart)
    └── widgets/
```

### 5.3. Strict Architecture Rules (Wajib Dipatuhi)

AI Developer atau tim *engineer* **harus** mematuhi aturan *hook* berikut:

1. **Root Folder Bersih:** Dilarang membuat folder `repositories/`, `router/`, atau `tables/` sejajar dengan `data/domain/presentation` di root fitur.
2. **Isolasi Domain:** Layer `domain/` **DILARANG KERAS** mengimpor Flutter, Dio, atau Drift. Tidak boleh ada `fromJson`/`toJson` di *domain entity*.
3. **Isolasi Presentation:** Layer `presentation/` **DILARANG** mengimpor Dio/Drift secara langsung.
4. **Aturan Dio:** `package:dio` hanya boleh dipakai di `*_remote_data_source.dart` dan `*_repository_impl.dart`. Wajib memanggil `mapDioException()` di *repository impl*.
5. **Aturan Freezed:** Harus menggunakan `@freezed` bersamaan dengan `sealed class`. Dilarang menggunakan `abstract class`, `@immutable`, atau `@unfreezed`. Hanya boleh ada satu deklarasi `@freezed` per file.
6. **Aturan Riverpod:** Provider fungsional harus menggunakan `Ref` generik dengan *import* eksplisit `package:flutter_riverpod/flutter_riverpod.dart`. *Class provider* hasil *generate* tidak perlu akhiran `Notifier`.
7. **Aturan GoRouter:** `redirect` harus menggunakan `ref.read`/`ref.listen`, dilarang menggunakan `ref.watch`. Semua *route* didaftarkan di `core/navigation/routes.dart`.

### 5.4. Backend & API

- Base URL produksi: `https://privis.briczz.my.id/v1`.
- Kontrak lengkap: [`api-contract.md`](api-contract.md) dan [`openapi.yaml`](openapi.yaml); Swagger runtime di `/docs`.
- Modul: `auth`, `users`, `projects`, `documents`, `dashboard`, `activities`, `health`.
- Auth: JWT access 15 menit + refresh token opaque (rotasi, hash di server).
- Dokumen disimpan di MinIO privat; unduhan melalui stream API (bukan signed URL).
- Semua endpoint selain health/login/refresh/logout memerlukan Bearer token.
- Rate limit: 120 request/menit/IP; login 5 percobaan/menit/IP.

## 6. Strategi Data

Data **tidak boleh** di-hardcode di presentation layer.

1. `*_remote_data_source.dart` memanggil endpoint Dio dan mengembalikan payload JSON.
2. `*_dto.dart` mem-parsing payload (Freezed + JSON Serializable).
3. `*_model.dart` memetakan DTO ke entity domain (role/status/enum dinormalisasi di sini).
4. `*_repository_impl.dart` menangkap `DioException` dan melempar exception domain melalui `mapDioException()`.
5. `domain/` hanya mengenal entity murni; `presentation/` mengakses data lewat usecase/repository.

Contoh payload nyata ada di [`api-contract.md`](api-contract.md) dan dapat diuji langsung melalui Swagger `/docs`.

**Cache offline (sudah aktif):** snapshot JSON data baca disimpan di Drift
(`cache_snapshots`) dengan `updated_at`. Repository mencoba jaringan terlebih
dahulu; jika gagal karena koneksi/timeout, snapshot dipakai dan entity ditandai
`isFromCache` sehingga UI menampilkan banner data luring. Error autentikasi,
izin, atau validasi tidak memakai cache. Cache dihapus saat login/logout agar
data tidak berpindah akun. Setelah dashboard berhasil dimuat, daftar proyek
dihangatkan di latar belakang; detail proyek disimpan saat pertama kali dibuka
online. Key cache: `dashboard`,
`projects:page=...:limit=...:status=...:search=...`, dan `project:<code>`.

## 7. Di Luar Cakupan

- Notifikasi push, komentar per dokumen, dan versioning file.
- Multi-tenant dan akses klien.
- Realtime websocket.
- Antrean aksi tulis offline (upload/PATCH saat tanpa jaringan).
- Audit log aksi admin.
- Restore dokumen yang sudah dihapus.

## 8. Roadmap & Definition of Done

### Fase 2 — Definition of Done (tercapai)

- [x] Backend REST API berjalan di VPS dan terhubung PostgreSQL + MinIO.
- [x] Auth, role, dan seluruh endpoint baca terintegrasi di Flutter.
- [x] Upload/download/hapus dokumen dari aplikasi.
- [x] Update tahap & status proyek dari aplikasi.
- [x] Ganti password dan manajemen user oleh admin.
- [x] Hardening: rate limit, Swagger, magic-bytes, akun layanan MinIO.
- [x] Cache offline Drift + indikator data luring.
- [x] Test dan dokumentasi cache offline (unit test fallback, integration test Drift di perangkat, migrasi `v1_to_v2.md`).

### Fase 3 — Backlog

1. Backup offsite otomatis + monitoring uptime.
2. Pagination Semua Proyek >100 dan deep-link setelah login.
3. Antivirus scan dokumen.
4. Audit log aksi admin.

## 9. Verifikasi

```bash
# Flutter
flutter analyze
flutter test

# Backend
npm run build
npm run lint
npm test
```

Deploy backend: `cd ~/privis_track_api && ./build.sh` (lihat `privis_track_api/docs/deployment-vps.md`).
