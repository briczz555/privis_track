# PriVis Track — panduan agen

Aplikasi internal (*in-house*) untuk melacak progres proyek klien lewat 8 tahap SDLC
sekaligus menjadi arsip dokumen tim. Platform: Flutter (Android & iOS).
PRD lengkap: [`docs/privis_track.md`](docs/privis_track.md).

## Arsitektur

Feature-first + Clean Architecture (pola plugin `flutter-clean-starter`).

```
lib/
├── core/                 # infrastruktur bersama (navigation, network, theme, storage)
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

## Backend

Fase 1 **belum ada backend** — data dummy berada di `*_remote_data_source.dart`
(`Future.delayed` + payload JSON statis) dan dipetakan DTO → Model → Entity.
`lib/core/network/dio_provider.dart` masih memakai base URL placeholder
(`https://api.example.com`). Auth API: belum ada.

Fase 2: ganti isi data source dengan pemanggilan Dio, lalu hapus payload dummy-nya.

## Status fitur

- `features/dashboard/` — selesai: donut portfolio interaktif, proyek berjalan,
  aktivitas tim, dan halaman **Semua Proyek** (`/projects`) dengan filter status.
  Proyek Selesai/Ditunda/Belum Mulai bisa dibuka ke project tracking dari sini.
- `features/project_tracking/` — selesai: timeline vertikal 8 tahap (semua tahap clickable,
  tanpa step-lock), ringkasan progres, document vault bottom sheet + mock upload.
  Route: `/projects/:projectId` (dibuka dari kartu proyek dashboard atau Semua Proyek).

Helper lintas fitur ada di `core/`: `constants/project_status.dart`,
`constants/sdlc_stages.dart`, `extensions/project_status_style.dart`,
`widgets/project_status_chip.dart`, `widgets/section_header.dart`,
`widgets/app_loading_state.dart`, `widgets/app_error_state.dart`,
`utils/date_formatter.dart`, `utils/error_message.dart`.
Jangan menduplikasi helper tersebut di dalam fitur.

## Konvensi proyek — plugin flutter-clean-starter

### Kapan WAJIB `flutter analyze` / `dart run build_runner build`

- Setelah scaffold fitur baru, atau edit apa pun di `data/`, `domain/`, atau
  `presentation/providers/`.
- Setelah menambah/mengubah field di Entity, Model, DTO, atau Table (Drift).
- Setelah menambah import baru, provider baru, atau mengubah signature function/class.
- Setelah mengubah struktur folder (pindah/rename file).

### Kapan TIDAK perlu `flutter analyze` / `build_runner`

- Perubahan murni visual di `presentation/screens/` atau `presentation/widgets/`: padding,
  warna, ukuran font, teks statis, spacing, urutan widget — SELAMA tidak menambah import
  baru, tidak mengubah signature function/class, dan tidak menyentuh Entity/Model/Provider.
  Verifikasi cukup lewat hot reload / dilihat langsung oleh user.
- Kalau ragu apakah suatu perubahan "murni visual" atau tidak, tetap jalankan
  `flutter analyze`.

## Perintah verifikasi

```bash
flutter analyze
flutter test
dart run build_runner build
```
