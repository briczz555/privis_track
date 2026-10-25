# 📄 Product Requirements Document (PRD)

**Project Name:** PriVis Track
**Project Description:** Internal Project Tracking & Document Archive App
**Phase:** Phase 1 – Mobile UI/UX Implementation & Architecture Setup
**Platform:** Mobile App (Flutter / Android & iOS)
**Base Architecture:** [briczz555/flutter-clean-starter](https://github.com/briczz555/flutter-clean-starter)
**Document Status:** Approved for Development

---

## 1. Product Overview & Vision
Aplikasi internal (*in-house tool*) yang dirancang khusus untuk tim *software house* guna melacak progres proyek klien melalui 8 tahap *Software Development Life Cycle* (SDLC).
Aplikasi ini berfungsi sebagai **pusat arsip dokumen** agar seluruh anggota tim lintas divisi (PM, Developer, Finance) memiliki transparansi status proyek secara *real-time*.

## 2. Project Scope & Phasing
* ✅ **Fase 1 (Current Scope):**
  * Inisialisasi proyek menggunakan skill `/flutter-clean-starter/start`.
  * Pengembangan antarmuka (UI/UX) untuk fitur *Dashboard* dan *Project Tracking*.
  * Implementasi navigasi (GoRouter), *state management* (Riverpod), dan *data modeling* (Freezed).
  * Penggunaan **Dummy Data** yang diimplementasikan pada lapisan Data Source (Mock).
* ⏳ **Fase 2 (Future Scope):**
  * Pengembangan Backend & REST API.
  * Integrasi Dio `remote_data_source` ke API sesungguhnya.
  * Penyimpanan luring menggunakan Drift di `core/storage/`.

## 3. Target Audience (User Personas)
Aplikasi ini **TIDAK** dapat diakses oleh klien. Pengguna eksklusif:
1. **Project Manager (PM):** Memantau *timeline* dan status tahapan.
2. **Developer & QA:** Mengakses referensi dokumen teknis dan mengunggah UAT *checklist*.
3. **Finance / Admin:** Mengunggah *invoice* dan bukti pembayaran.

## 4. Core Features & Requirements (Phase 1)

### 4.1. Feature: Dashboard (`lib/features/dashboard/`)
* **Portfolio Chart:** *Donut/Pie Chart* interaktif yang memvisualisasikan proporsi status proyek.
* **Active Projects List:** Daftar proyek berjalan dengan indikator persentase (*progress bar*).
* **Team Activity Feed:** Daftar vertikal log aktivitas terbaru (misal: "Finance uploaded BAST 1").

### 4.2. Feature: Project Tracking (`lib/features/project_tracking/`)
* **Vertical 8-Stage Timeline UI:** Menampilkan 8 tahap SDLC secara vertikal (Discovery hingga Maintenance).
* **No Step-Lock Logic:** Semua tahap bersifat *clickable* tanpa validasi status progres (akses bebas untuk arsip internal).
* **Document Vault (Bottom Sheet):** Menampilkan daftar file per tahapan dan tombol *mock upload*.

---

## 5. Technical Specifications (Clean Architecture)

Pengembangan **wajib** mengikuti pola **Feature-first + Clean Architecture** sesuai aturan `flutter-clean-starter`. Segala pelanggaran akan diblokir oleh *hook* pengecekan struktur.

### 5.1. Tech Stack Utama
* **State Management:** Riverpod + Riverpod Generator (menggunakan `Ref` generik).
* **Data Modeling:** Freezed + JSON Serializable (`sealed class` wajib digunakan).
* **Routing:** GoRouter (terpusat di `core/navigation/`).
* **Network & DB:** Dio (untuk Mock API sementara) & Drift (jika diperlukan untuk *caching* dummy di Fase 1).

### 5.2. Layering Strategy per Feature
Setiap fitur (misal: `dashboard`, `project_tracking`) harus memiliki struktur internal berikut:
```text
lib/features/<feature_name>/
├── data/
│   ├── datasources/ (<feature_name>_remote_data_source.dart) -> Berisi Mock Future.delayed
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

## 6. Dummy Data Implementation Strategy

Karena ini adalah Fase 1 (Mock State), data *dummy* tidak boleh di- *hardcode* di *Presentation Layer*.
* **Data Source:** Buat `ProjectRemoteDataSource` yang mengembalikan `Future.delayed` berisi struktur JSON Statis.
* **DTO:** Gunakan Freezed `sealed class` untuk melakukan *parsing* JSON *dummy* tersebut di `ProjectDto`.
* **Mapping:** `ProjectRepositoryImpl` memetakan `ProjectDto` menjadi `ProjectEntity` (bebas JSON) untuk dilempar ke *Domain Layer*.

**Contoh Struktur JSON Dummy yang akan di-parsing:**
```json
{
  "id": "PRJ-001",
  "name": "E-Commerce App",
  "client": "PT. ABC",
  "status": "In Progress",
  "current_stage": 4, 
  "stages": [
     {
       "id": 1,
       "title": "Discovery & Brief",
       "is_completed": true,
       "documents": [
          { "name": "MoM.pdf", "type": "pdf", "url": "https://dummy.link" }
       ]
     }
  ]
}
```