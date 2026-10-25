# PriVis Track

Aplikasi internal untuk melacak progres proyek klien melalui 8 tahap SDLC sekaligus
menjadi arsip dokumen tim (PM, Developer/QA, Finance). Dibangun dengan Flutter.

## Status — Fase 1

- ✅ Fondasi `core/` (theme, GoRouter, Dio provider, error mapping, Drift database).
- ✅ Fitur **Dashboard**: donut chart portofolio interaktif, daftar proyek berjalan
  dengan progress bar, dan feed aktivitas tim.
- ✅ Halaman **Semua Proyek** (`/projects`): daftar seluruh proyek dengan filter status
  (Berjalan, Ditunda, Belum Mulai, Selesai), sehingga proyek non-aktif tetap bisa dibuka.
- ✅ Fitur **Project Tracking**: timeline vertikal 8 tahap SDLC (semua tahap bisa dibuka
  tanpa validasi urutan), ringkasan progres, dan document vault bottom sheet dengan
  mock upload. Dibuka lewat route `/projects/:projectId`.

Data masih dummy dari layer data source (`Future.delayed` + JSON statis), belum ada
backend. Detail requirement ada di [`docs/privis_track.md`](docs/privis_track.md).

## Struktur

```
lib/
├── core/                 # navigation, network, theme, storage
├── features/
│   └── dashboard/
│       ├── data/         # remote data source (mock), dto, models, repository impl
│       ├── domain/       # entities, repository interface, usecase
│       └── presentation/ # providers (Riverpod), screens, widgets
└── main.dart
```

## Menjalankan

```bash
flutter pub get
dart run build_runner build     # generate Freezed, json_serializable, Riverpod
flutter run
```

## Verifikasi

```bash
flutter analyze
flutter test
```

Catatan: template `core/` memakai `sqlite3_flutter_libs` (Drift). Untuk build target
desktop Windows, aktifkan **Developer Mode** Windows agar Flutter bisa membuat symlink
plugin. Target Android/iOS tidak terpengaruh.
