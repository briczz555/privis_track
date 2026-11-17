# Fase 4 — Rancangan: Kalender Meeting

**Status:** ✅ Diimplementasikan 17 November 2026 (disetujui tanpa perubahan)
**Tanggal:** 17 November 2026
**Platform:** Flutter (Android/iOS) + NestJS/Prisma/PostgreSQL

---

## 1. Tujuan

Menambahkan kalender internal untuk menjadwalkan dan melihat meeting proyek:

- Meeting ditandai pada tanggal tertentu.
- Mode **Online** (link meeting) atau **Onsite** (datang langsung ke klien).
- Daftar karyawan yang ikut meeting.
- Terhubung ke proyek/klien bila relevan.
- Menjadi catatan operasional, bukan pengganti Google Calendar/Zoom.

## 2. Ringkasan UX

```text
Dashboard
  └── ikon kalender di header ──► /calendar

/calendar
  ├── header bulan + navigasi ◀ ▶
  ├── filter: Semua | Saya
  ├── grid kalender (titik = ada meeting)
  ├── agenda tanggal terpilih
  └── FAB "Meeting Baru" ──► /calendar/new

/calendar/:id
  ├── detail meeting + peserta
  └── edit / batalkan (sesuai izin)

/calendar/:id/edit
```

## 3. Scope

### Termasuk v1

- Tampilan kalender bulanan + agenda per hari.
- Buat, edit, dan batalkan meeting (soft cancel).
- Mode online/onsite, lokasi atau link meeting.
- Peserta meeting (karyawan aktif).
- Relasi opsional ke proyek; klien mengikuti proyek.
- Filter “Semua” dan “Saya” (sebagai peserta/organizer).
- Audit log untuk create/update/cancel.
- Zona waktu: disimpan UTC, ditampilkan WIB.

### Di luar v1

- Meeting berulang (recurring).
- Undangan eksternal/non-karyawan.
- RSVP/kehadiran (hadir/tidak hadir).
- Notifikasi push/reminder.
- Integrasi Zoom/Google Meet otomatis.
- Lampiran meeting (gunakan document vault proyek).
- Drag-and-drop reschedule.
- Deteksi bentrok sebagai hard-block (bisa jadi v2).

## 4. User Stories

| ID | Sebagai | Ingin | Agar |
|---|---|---|---|
| M-01 | Semua user | melihat meeting pada kalender bulanan | tahu jadwal tim |
| M-02 | Semua user | membuka agenda tanggal tertentu | melihat detail meeting hari itu |
| M-03 | Semua user | membuat meeting online/onsite | menjadwalkan koordinasi |
| M-04 | Organizer/Admin/PM | mengedit atau membatalkan meeting | menyesuaikan jadwal |
| M-05 | Semua user | melihat peserta meeting | tahu siapa yang terlibat |
| M-06 | Semua user | memfilter “Saya” | fokus pada meeting sendiri |
| M-07 | Admin | melihat riwayat perubahan meeting | audit operasional |

## 5. UX Detail

### 5.1. Entry point

- Ikon `calendar_month` di header Dashboard, di samping avatar Pengaturan.
- Opsional (v1.1): kartu **“Meeting Hari Ini”** di Dashboard dengan maksimal 3 meeting.

### 5.2. Calendar Screen (`/calendar`)

- Header: nama bulan + tahun, tombol prev/next, tombol “Hari ini”.
- Filter chip: **Semua** / **Saya**.
- Grid 7 kolom:
  - tanggal dari bulan sebelumnya/berikutnya ditampilkan redup;
  - titik atau angka jumlah meeting;
  - tanggal terpilih diberi highlight;
  - hari ini diberi outline.
- Agenda di bawah grid:
  - daftar meeting pada tanggal terpilih, urut jam;
  - jika kosong: “Tidak ada meeting pada tanggal ini.”
- Kartu meeting:
  - jam mulai–selesai;
  - judul;
  - badge **Online** / **Onsite**;
  - proyek/klien (jika ada);
  - inisial peserta (maks. 3 + “+N”).
- Meeting berstatus **cancelled** tetap tampil dengan coret/badge “Dibatalkan” agar riwayat jelas.
- FAB **Meeting Baru**.

### 5.3. Form Meeting (`/calendar/new`, `/calendar/:id/edit`)

Field:

| Field | Wajib | Catatan |
|---|---|---|
| Judul | Ya | maks. 150 karakter |
| Tanggal | Ya | date picker |
| Jam mulai / selesai | Ya | end > start; maks. 24 jam |
| Mode | Ya | Online / Onsite |
| Link meeting | Online | URL opsional; divalidasi jika diisi |
| Lokasi | Onsite | default alamat klien jika proyek dipilih |
| Proyek | Tidak | dropdown; klien mengikuti proyek |
| Peserta | Ya | minimal organizer; multi-select user aktif |
| Agenda/notes | Tidak | maks. 2000 karakter |

Perilaku:

- Organizer otomatis menjadi peserta.
- Saat proyek dipilih dan mode Onsite, lokasi diisi alamat klien (bisa diubah).
- Participant picker berupa bottom sheet dengan pencarian nama/divisi.
- Simpan → kembali ke kalender, bulan meeting otomatis dipilih.
- Edit hanya untuk organizer, admin, atau PM.

### 5.4. Detail Meeting (`/calendar/:id`)

- Judul, tanggal/jam, mode, status.
- Proyek/klien (tap → Project Tracking).
- Link online (tap untuk buka) atau lokasi onsite.
- Organizer + daftar peserta (nama, role, divisi).
- Agenda/notes.
- Tombol **Edit** dan **Batalkan Meeting** sesuai izin.
- Konfirmasi sebelum membatalkan.

## 6. Hak Akses

| Aksi | Admin | PM | Developer/QA/Finance |
|---|---|---|---|
| Lihat semua meeting | ✅ | ✅ | ✅ |
| Buat meeting (jadi organizer) | ✅ | ✅ | ✅ |
| Edit/batalkan meeting sendiri | ✅ | ✅ | ✅ |
| Edit/batalkan meeting orang lain | ✅ | ✅ | ❌ |
| Pilih peserta | ✅ | ✅ | ✅ (user aktif) |

Catatan: semua user internal dapat melihat kalender. Jika nanti perlu meeting privat, tambahkan field `visibility` di v2.

## 7. Data Model (Prisma — usulan)

```prisma
enum MeetingMode {
  online
  onsite
}

enum MeetingStatus {
  scheduled
  cancelled
}

model Meeting {
  id           String        @id @default(uuid()) @db.Uuid
  title        String
  agenda       String?
  mode         MeetingMode
  status       MeetingStatus @default(scheduled)
  startAt      DateTime      @map("start_at") @db.Timestamptz(3)
  endAt        DateTime      @map("end_at") @db.Timestamptz(3)
  meetingUrl   String?       @map("meeting_url")
  location     String?
  projectId    String?       @map("project_id") @db.Uuid
  organizerId  String        @map("organizer_id") @db.Uuid
  notes        String?
  createdAt    DateTime      @default(now()) @map("created_at")
  updatedAt    DateTime      @updatedAt @map("updated_at")

  project      Project?      @relation(fields: [projectId], references: [id], onDelete: SetNull)
  organizer    User          @relation("MeetingOrganizer", fields: [organizerId], references: [id], onDelete: Restrict)
  participants MeetingParticipant[]

  @@index([startAt])
  @@index([projectId, startAt])
  @@map("meetings")
}

model MeetingParticipant {
  meetingId String   @map("meeting_id") @db.Uuid
  userId    String   @map("user_id") @db.Uuid
  createdAt DateTime @default(now()) @map("created_at")

  meeting Meeting @relation(fields: [meetingId], references: [id], onDelete: Cascade)
  user    User    @relation(fields: [userId], references: [id], onDelete: Restrict)

  @@id([meetingId, userId])
  @@index([userId])
  @@map("meeting_participants")
}
```

Tambahan relasi:

```prisma
model User {
  // ...
  organizedMeetings Meeting[]            @relation("MeetingOrganizer")
  meetingInvites    MeetingParticipant[]
}

model Project {
  // ...
  meetings Meeting[]
}
```

Keputusan:

- `projectId` **opsional** agar meeting internal (tanpa proyek) tetap bisa.
- Klien tidak disimpan langsung; jika proyek dipilih, klien diambil dari `project.client`.
- Peserta disimpan sebagai relasi; user nonaktif tetap muncul di meeting historis.
- Tidak ada hard delete; pembatalan mengubah `status`.

## 8. API Contract (usulan)

### 8.1. `GET /v1/users/options`

Semua user terautentikasi. Daftar user **aktif** untuk participant picker:

```json
{
  "data": [
    { "id": "...", "name": "Rina", "role": "pm", "division": "PM" }
  ]
}
```

### 8.2. `GET /v1/meetings`

Query:

- `from`, `to` — ISO 8601 (wajib), rentang maks. 92 hari.
- `scope` — `all` (default) atau `mine`.
- `project_code` — opsional.

Contoh:

```http
GET /v1/meetings?from=2026-10-31T17:00:00Z&to=2026-11-30T17:00:00Z&scope=all
```

Respons:

```json
{
  "data": [
    {
      "id": "...",
      "title": "Kickoff Meeting",
      "agenda": "Pembahasan lingkup",
      "mode": "online",
      "status": "scheduled",
      "start_at": "2026-11-20T02:00:00.000Z",
      "end_at": "2026-11-20T03:00:00.000Z",
      "meeting_url": "https://meet.google.com/...",
      "location": null,
      "project": { "id": "...", "code": "PRJ-001", "name": "E-Commerce App" },
      "client": { "id": "...", "name": "PT. ABC Retail" },
      "organizer": { "id": "...", "name": "Rina", "role": "pm", "division": "PM" },
      "participants": [
        { "id": "...", "name": "Budi", "role": "developer", "division": "Engineering" }
      ],
      "created_at": "...",
      "updated_at": "..."
    }
  ]
}
```

- Tanpa pagination di v1; batas 500 meeting per rentang, error `422` jika rentang terlalu besar.
- `scope=mine` mencocokkan organizer atau peserta.
- Urut `start_at asc`.

### 8.3. `GET /v1/meetings/{id}`

Detail meeting; `404` jika tidak ada.

### 8.4. `POST /v1/meetings`

Semua user terautentikasi.

```json
{
  "title": "Kickoff Meeting",
  "agenda": "Pembahasan lingkup",
  "mode": "online",
  "start_at": "2026-11-20T02:00:00.000Z",
  "end_at": "2026-11-20T03:00:00.000Z",
  "meeting_url": "https://meet.google.com/...",
  "location": null,
  "project_code": "PRJ-001",
  "participant_ids": ["uuid-1", "uuid-2"],
  "notes": "..."
}
```

Aturan:

- `end_at > start_at`, maksimal 24 jam.
- `mode=online`: `meeting_url` opsional, divalidasi URL http/https.
- `mode=onsite`: `location` wajib; jika kosong dan proyek punya alamat klien, server mengisinya.
- `participant_ids` divalidasi user aktif, dideduplikasi; organizer otomatis ditambahkan.
- `project_code` opsional; `404` jika tidak ditemukan.
- Respons `201` Meeting.
- Audit: `meeting.created`.

### 8.5. `PATCH /v1/meetings/{id}`

Body sama, semua field opsional. Hanya organizer, admin, atau PM.

- Jika `participant_ids` dikirim, daftar diganti (organizer tetap disertakan).
- Meeting `cancelled` tidak bisa diedit; harus dibuat baru.
- Audit: `meeting.updated`.

### 8.6. `POST /v1/meetings/{id}/cancel`

Hanya organizer/admin/PM; idempoten.

- Mengubah `status=cancelled`.
- Respons `200` Meeting.
- Audit: `meeting.cancelled`.

### 8.7. Error umum

| Status | Kasus |
|---|---|
| 400 | end <= start, durasi > 24 jam, peserta tidak valid |
| 403 | edit/cancel meeting orang lain |
| 404 | meeting/proyek tidak ditemukan |
| 422 | validasi field/rentang tanggal |

## 9. Arsitektur Flutter

```text
lib/features/meeting_calendar/
├── data/
│   ├── datasources/meeting_remote_data_source.dart
│   ├── dto/meeting_dto.dart
│   ├── dto/meeting_participant_dto.dart
│   ├── dto/user_option_dto.dart
│   ├── models/...
│   └── repositories/meeting_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── meeting_entity.dart
│   │   ├── meeting_mode.dart
│   │   ├── meeting_status.dart
│   │   └── meeting_participant_entity.dart
│   ├── repositories/meeting_repository.dart
│   └── usecases/
│       ├── get_meetings_usecase.dart
│       ├── get_meeting_usecase.dart
│       ├── create_meeting_usecase.dart
│       ├── update_meeting_usecase.dart
│       ├── cancel_meeting_usecase.dart
│       └── get_user_options_usecase.dart
└── presentation/
    ├── providers/meeting_calendar_provider.dart
    ├── screens/calendar_screen.dart
    ├── screens/meeting_form_screen.dart
    ├── screens/meeting_detail_screen.dart
    └── widgets/month_calendar_grid.dart
        widgets/meeting_card.dart
        widgets/participant_picker_sheet.dart
```

Provider:

- `meetingsProvider(String rangeKey)` — family dengan key
  `from_to_scope` (String) agar Riverpod Generator aman.
- `meetingDetailProvider(id)`.
- `userOptionsProvider` — user aktif untuk picker.
- `projectOptionsProvider` — memakai `GET /projects?limit=100`.
- Mutasi: create/update/cancel → invalidate provider bulan terkait + audit list bila perlu.

Routes:

- `/calendar`
- `/calendar/new`
- `/calendar/:meetingId`
- `/calendar/:meetingId/edit`

Deep-link login yang sudah ada otomatis berlaku untuk route ini.

## 10. Kalender & Zona Waktu

- Server menyimpan `timestamptz` (UTC).
- Klien mengirim ISO UTC; menampilkan waktu lokal perangkat (WIB).
- Saat mengambil rentang bulan, klien mengirim awal/akhir grid dalam UTC:
  - mis. November 2026 → `2026-10-31T17:00:00Z` s.d. `2026-11-30T17:00:00Z`.
- Hari pada grid dihitung dari waktu lokal.
- Format tanggal menggunakan `core/utils/date_formatter.dart`.

## 11. Edge Cases & Validasi

- Meeting melewati tengah malam: boleh, tetap ditampilkan pada tanggal mulai.
- Meeting batal: tetap tampil dengan status “Dibatalkan”; tidak bisa diedit.
- Peserta nonaktif: tidak muncul di picker; tetap tampil di meeting lama.
- Proyek dihapus: tidak ada fitur hapus proyek; jika nanti ada, `projectId` menjadi null.
- Peserta duplikat: dideduplikasi server.
- Organizer tidak ada di `participant_ids`: server menambahkan.
- Overlap jadwal: **diizinkan** di v1; tidak ada hard-block.
- Rentang query > 92 hari: `422`.
- Meeting tanpa proyek: diperbolehkan; lokasi onsite diisi manual.
- Meeting pada masa lalu: diperbolehkan untuk dokumentasi.

## 12. Audit & Activity

Audit log (tabel yang sudah ada) menambah entity `meeting`:

- `meeting.created`
- `meeting.updated`
- `meeting.cancelled`

Ringkasan contoh:

- `membuat meeting "Kickoff" pada 20 Nov 2026`
- `membatalkan meeting "Kickoff"`

Activity feed proyek **tidak** diubah di v1 (opsional v2: `meeting_scheduled`).

## 13. Testing Plan

Backend:

- Create online/onsite, validasi end > start, peserta aktif, organizer auto.
- Edit/cancel oleh organizer vs user lain (403).
- Query rentang + scope mine/all + filter proyek.
- Audit entry terbentuk.
- Timezone round-trip.

Flutter:

- Mapping DTO → entity.
- Grid kalender: padding awal/akhir bulan, tanggal terpilih, titik meeting.
- Agenda tanggal terpilih dan empty state.
- Form validation (mode online/onsite, end > start, peserta).
- Permission tombol edit/cancel.
- Widget test kalender + detail.
- Live test ke API lokal (create → list → edit → cancel).

## 14. Migrasi & Deployment

- Migration baru: enum `MeetingMode`, `MeetingStatus`, tabel `meetings`, `meeting_participants`, relasi User/Project.
- Tidak ada backfill data.
- Deploy backend via `./build.sh` (migrate otomatis).
- APK baru; fitur muncul untuk semua user.
- Tidak ada env baru.

## 15. Estimasi & Urutan Pengerjaan

| Tahap | Isi | Estimasi |
|---|---|---|
| 1 | Schema + migration + endpoint + audit + test backend | 1–1,5 hari |
| 2 | Data/domain/repository/provider Flutter | 0,5–1 hari |
| 3 | Calendar screen + grid + agenda | 1–1,5 hari |
| 4 | Form + participant/project picker + validasi | 1 hari |
| 5 | Detail + cancel + permission | 0,5 hari |
| 6 | Dashboard entry + test + docs | 0,5–1 hari |

Total kasar: **4–6 hari kerja**.

## 16. Keputusan yang Perlu Direview

| # | Pertanyaan | Rekomendasi |
|---|---|---|
| 1 | Proyek wajib atau opsional? | **Opsional** (meeting internal tetap bisa) |
| 2 | Siapa boleh membuat meeting? | **Semua user**; edit/cancel organizer/admin/PM |
| 3 | Semua user boleh melihat semua meeting? | **Ya** (internal transparency) |
| 4 | Perlu RSVP/kehadiran? | **Tidak di v1** |
| 5 | Perlu reminder/push? | **Tidak di v1** (bisa lokal di v1.1) |
| 6 | Perlu recurring meeting? | **Tidak** |
| 7 | Entry point kalender? | **Ikon header Dashboard** + kartu meeting hari ini (opsional) |
| 8 | Offline cache kalender? | **Online-first v1**, cache di v1.1 |
| 9 | Lokasi onsite default? | **Alamat klien** dari proyek, bisa diubah |
| 10 | Overlap jadwal? | **Diizinkan**, tanpa hard-block |

## 17. Acceptance Criteria

- [ ] Meeting online/onsite dapat dibuat dan muncul di tanggal yang benar.
- [ ] Peserta tampil di kartu dan detail meeting.
- [ ] Mode onsite dapat memakai alamat klien atau lokasi manual.
- [ ] Filter Semua/Saya berfungsi.
- [ ] Organizer/admin/PM dapat edit/cancel; user lain tidak.
- [ ] Meeting batal tetap terlihat dengan status jelas.
- [ ] Audit log mencatat create/update/cancel.
- [ ] Waktu WIB tampil benar (server UTC).
- [ ] Validasi end > start dan field wajib berjalan.
- [ ] Test backend + Flutter lulus; APK ter-build.
- [ ] Dokumentasi kontrak/OpenAPI/PRD diperbarui saat implementasi.
