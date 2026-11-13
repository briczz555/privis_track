# PriVis Track — panduan agen

Aplikasi internal (*in-house*) untuk melacak progres proyek klien lewat 8 tahap SDLC
sekaligus menjadi arsip dokumen tim. Platform: Flutter (Android & iOS).
PRD: [`docs/privis_track.md`](docs/privis_track.md).

## Arsitektur

Feature-first + Clean Architecture (pola plugin `flutter-clean-starter`).

```
lib/
├── core/                 # navigation, network, auth session cache, theme, storage
├── features/<feature>/
│   ├── data/             # datasources, dto, models, repositories (impl)
│   ├── domain/           # entities, repositories (interface), usecases — murni Dart
│   └── presentation/     # providers, screens, widgets
└── main.dart
```

Aturan yang tidak boleh dilanggar:

- Root fitur hanya `data/`, `domain/`, `presentation/`. Tidak ada folder `repositories/`,
  `router/`, atau `tables/` sejajar dengan ketiganya.
- `domain/` tidak mengimpor Flutter/Dio/Drift dan tidak punya `fromJson`/`toJson`.
- `presentation/` tidak mengimpor Dio/Drift; akses data lewat usecase/repository domain.
- `package:dio` hanya di `*_remote_data_source.dart` dan `*_repository_impl.dart`
  (yang wajib memanggil `mapDioException()`).
- Semua `@freezed` memakai `sealed class`, satu deklarasi per file.
- Provider fungsional memakai `Ref` generik + import eksplisit
  `package:flutter_riverpod/flutter_riverpod.dart`. Class `XNotifier` menghasilkan
  `xProvider`.
- Route hanya didaftarkan di `core/navigation/routes.dart`; `redirect` GoRouter memakai
  `ref.read`/`ref.listen`, bukan `ref.watch`.
- Warna, spacing, tipografi, shape diambil dari `lib/core/theme/` — jangan hardcode
  `Color(0x...)`, padding, atau `TextStyle` baru di widget.

## Backend & API

- Backend: repo `privis_track_api` (NestJS + Prisma + PostgreSQL + MinIO) di VPS.
- Base URL default: `https://privis.briczz.my.id/v1`
  (override `--dart-define=API_BASE_URL=...`).
- Kontrak: `docs/api-contract.md` + `docs/openapi.yaml`.
- Endpoint yang dipakai app: `/auth/login`, `/auth/refresh`, `/auth/logout`, `/me`,
  `/dashboard`, `/projects`, `/projects/{code}`, `/activities`, upload/list/download
  dokumen.
- Auth: JWT access 15 menit, refresh rotation; token disimpan dengan
  `flutter_secure_storage` lewat `core/auth/auth_session_cache.dart` + `features/auth/`.
- `AuthInterceptor` menambahkan Bearer token dan mencoba refresh sekali saat 401.
- Dokumen: upload multipart (maks 20 MB, tipe tertentu), download via API stream,
  soft delete admin/pm.

## Status fitur

- `features/auth/` — login, restore sesi, refresh token, logout, ganti password,
  halaman pengaturan.
- `features/dashboard/` — dashboard API (portfolio, proyek aktif, aktivitas) dan
  halaman **Semua Proyek** (`/projects`) dengan filter status + pagination
  server-side (infinite scroll).
- `features/project_tracking/` — timeline 8 tahap (semua clickable, no step-lock),
  ringkasan progres, kontak klien, document vault (upload/download/hapus), aksi PM/admin
  untuk menandai selesai/membuka tahap dan mengubah status proyek.
  Route: `/projects/:projectCode`.
- `features/user_management/` — halaman **Kelola User** (khusus admin): daftar user,
  tambah, ubah nama/role/divisi, aktif/nonaktifkan, dan reset password.
  Route: `/settings/users`.
- `features/audit_log/` — halaman **Audit Log** (khusus admin): riwayat aksi admin
  dengan pagination. Route: `/settings/audit-logs`.
- `features/project_management/` — form **Tambah/Edit Proyek** (admin/PM): nama,
  tanggal mulai/tenggat, pilih klien existing atau buat klien baru, edit kontak
  klien. Route: `/projects/new`, `/projects/:projectCode/edit`.
  Klien shared: perubahan kontak berlaku untuk semua proyek klien tersebut.

Helper lintas fitur di `core/`: `constants/project_status.dart`,
`constants/sdlc_stages.dart`, `extensions/project_status_style.dart`,
`widgets/project_status_chip.dart`, `widgets/section_header.dart`,
`widgets/app_loading_state.dart`, `widgets/app_error_state.dart`,
`utils/date_formatter.dart`, `utils/error_message.dart`, `auth/auth_session_cache.dart`,
`storage/cache_store.dart`, `widgets/offline_banner.dart`.
Jangan menduplikasi helper tersebut di dalam fitur.

## Konvensi verifikasi

### Kapan WAJIB `flutter analyze` / `dart run build_runner build`

- Setelah scaffold fitur baru, atau edit apa pun di `data/`, `domain/`, atau
  `presentation/providers/`.
- Setelah menambah/mengubah field di Entity, Model, DTO, atau Table (Drift).
- Setelah menambah import baru, provider baru, atau mengubah signature function/class.
- Setelah mengubah struktur folder (pindah/rename file).

### Kapan TIDAK perlu

- Perubahan murni visual di `presentation/screens/` atau `presentation/widgets/`
  (padding, warna, ukuran font, teks statis, spacing) selama tidak menambah import baru,
  tidak mengubah signature, dan tidak menyentuh Entity/Model/Provider. Verifikasi cukup
  lewat hot reload.
- Kalau ragu, tetap jalankan `flutter analyze`.

## Perintah

```bash
flutter analyze
flutter test
dart run build_runner build
flutter run                                   # production API default
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3000/v1
```
