# PriVis Track

Aplikasi internal untuk melacak progres proyek klien melalui 8 tahap SDLC sekaligus
menjadi arsip dokumen tim (PM, Developer/QA, Finance). Dibangun dengan Flutter.

## Status

- Fondasi `core/`: theme, GoRouter, Dio, error mapping, Drift, date/error utils.
- **Auth**: login JWT, refresh token rotation, secure storage, redirect guard.
- **Dashboard**: donut chart portofolio, proyek berjalan, activity feed dari API.
- **Semua Proyek** (`/projects`): daftar semua proyek + filter status.
- **Project Tracking** (`/projects/:projectCode`): timeline 8 tahap, kontak klien,
  document vault (read-only).
- Data diambil dari backend `privis_track_api` di VPS.

Belum tersedia: upload/download dokumen, ubah status tahap/proyek, ganti password.

## Backend

- API: `https://privis.briczz.my.id/v1` (default aplikasi).
- Kontrak: [`docs/api-contract.md`](docs/api-contract.md), [`docs/openapi.yaml`](docs/openapi.yaml).
- Repo backend: `https://github.com/briczz555/privis_track_api`.

## Menjalankan

```bash
flutter pub get
dart run build_runner build
flutter run
```

Ganti base URL sesuai environment:

```bash
# Android emulator ke backend lokal
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3000/v1

# iOS simulator / desktop
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:3000/v1

# production (default)
flutter run --dart-define=API_BASE_URL=https://privis.briczz.my.id/v1
```

Login memakai akun internal yang dibuat lewat seed backend.

## Struktur

```
lib/
├── core/                 # navigation, network, auth session cache, theme, storage
├── features/
│   ├── auth/             # login, session, JWT refresh
│   ├── dashboard/        # dashboard + semua proyek
│   └── project_tracking/ # timeline + document vault
└── main.dart
```

## Verifikasi

```bash
flutter analyze
flutter test
```

Catatan build:
- Android/iOS adalah target utama.
- Untuk build desktop Windows, aktifkan **Developer Mode** agar Flutter bisa membuat
  symlink plugin (`flutter_secure_storage`, `sqlite3_flutter_libs`).
- `flutter_secure_storage` menyimpan token di secure storage perangkat.
