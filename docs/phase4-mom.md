# Fase 4.1 — Generate MoM dari Meeting

**Status:** ✅ Terimplementasi (backend + Flutter)
**Tanggal:** 19 November 2026
**Template sumber:** `Template_MoM_Client.docx` (dari pengguna)

---

## 1. Tujuan

Dari detail meeting, tim dapat membuat draft **Minutes of Meeting (MoM)**
berformat DOCX memakai template resmi perusahaan. **Hanya Bagian 1 (Informasi
Rapat) yang terisi otomatis**; bagian peserta, agenda, ringkasan pembahasan,
dan tanda tangan sengaja dibiarkan kosong sesuai template asli untuk diisi
manual di Word.

## 2. Keputusan final

| # | Keputusan |
|---|---|
| 1 | Output DOCX editable, bukan PDF. |
| 2 | File disimpan privat di MinIO dan ditautkan ke meeting (satu MoM aktif per meeting). |
| 3 | Peserta, agenda, pembahasan/keputusan, catatan, dan tanda tangan **kosong**; diisi manual setelah diunduh. |
| 4 | Tidak ada editor MoM di aplikasi. |
| 5 | Generate/buat ulang: organizer, admin, PM. Unduh: semua user terautentikasi. |
| 6 | Generate ulang mengganti file lama (dengan konfirmasi di app) dan dicatat di audit. |
| 7 | Meeting `cancelled` tidak bisa dibuatkan MoM; MoM lama tetap bisa diunduh. |
| 8 | Tanggal/jam ditampilkan dalam WIB (UTC+7). |

## 3. Pemetaan template

Template memiliki 7 placeholder di Bagian 1 (masing-masing satu paragraf):

| Placeholder template | Sumber data | Contoh hasil |
|---|---|---|
| `[Nama proyek]` | `meeting.project.name` atau `-` | E-Commerce App |
| `[Nama klien / perusahaan]` | `meeting.project.client.name` atau `-` | PT. ABC Retail |
| `[Contoh: Kickoff / Review Progres / UAT / Pembahasan Revisi]` | `meeting.title` | Kickoff Proyek |
| `[hh/bb/tttt]` | `start_at` → WIB `dd/MM/yyyy` | 20/11/2026 |
| `[00.00 – 00.00 WIB]` | `start_at`–`end_at` → WIB `HH.mm – HH.mm WIB` | 09.00 – 10.30 WIB |
| `[Lokasi / Google Meet / Zoom]` | Onsite: `location`; Online: `Online - <meeting_url>` | Online - https://meet.google.com/… |
| `[Nama]` | `organizer.name` | Rina Kusuma |

Bagian lain **tidak disentuh**: tabel peserta (5 baris kosong), `[Agenda 1..3]`,
tabel pembahasan (8 baris kosong), dan blok tanda tangan tetap seperti template.

## 4. Alur pengguna

```text
Detail Meeting
  └── Notulen (MoM)
        ├── Belum ada → [Buat MoM]
        └── Sudah ada → nama file · ukuran · tanggal · pembuat
                        [Unduh] [Buat Ulang]
```

Buat MoM → file dibuat di server → metadata MoM muncul di detail → Unduh membuka
file DOCX lewat aplikasi default (pola yang sama dengan document vault).

## 5. Implementasi backend (`privis_track_api`)

### File

- `src/meetings/mom/templates/mom-client.docx` — template resmi (di-copy dari
  file pengguna). Disertakan ke `dist/` lewat `nest-cli.json` (`assets`).
- `src/meetings/mom/mom-document.ts` — pengisian template.
- `src/meetings/mom/mom-fields.ts` — pemetaan meeting → field MoM, format WIB,
  nama file, MIME DOCX.
- `src/meetings/meetings.service.ts` — `generateMom()`, `downloadMom()`.
- `src/meetings/meetings.controller.ts` — endpoint MoM.
- `prisma/schema.prisma` + migration `add_meeting_moms`.

### Cara pengisian template

Word memecah satu teks menjadi beberapa `<w:r>`/`<w:t>` (placeholder di template
ini terpecah 1–9 run), sehingga replace teks biasa tidak bisa dipakai.
`fillMomDocument()`:

1. Membaca `word/document.xml` dari DOCX memakai `adm-zip`.
2. Menggabungkan teks setiap `<w:p>` untuk mengenali placeholder (whitespace
   dinormalisasi).
3. Menulis nilai ke `<w:t>` pertama paragraf tersebut dan mengosongkan `<w:t>`
   sisanya, sehingga formatting paragraf mengikuti template.
4. Meng-escape `&`, `<`, `>` agar XML tetap valid.
5. Gagal keras bila ada placeholder yang tidak ditemukan (template berubah).

Tidak memakai library templating tambahan; operasinya sempit dan deterministik,
sehingga hasilnya lebih aman terhadap formatting.

### Nama file

```text
MoM_<kode-proyek|UMUM>_<YYYY-MM-DD-WIB>_<slug-judul>.docx
```

Contoh: `MoM_PRJ-001_2026-11-20_kickoff-proyek.docx`.
Object key MinIO: `meetings/<meetingId>/mom/<uuid>-<nama-file>`.

### Data model

```prisma
model MeetingMom {
  id            String   @id @default(uuid()) @db.Uuid
  meetingId     String   @unique @map("meeting_id") @db.Uuid
  fileName      String   @map("file_name")
  storageKey    String   @map("storage_key")
  sizeBytes     Int      @map("size_bytes")
  generatedById String   @map("generated_by_id") @db.Uuid
  createdAt     DateTime @default(now()) @map("created_at")
  updatedAt     DateTime @updatedAt @map("updated_at")

  meeting     Meeting @relation(fields: [meetingId], references: [id], onDelete: Cascade)
  generatedBy User    @relation(fields: [generatedById], references: [id], onDelete: Restrict)

  @@map("meeting_moms")
}
```

`updated_at` dipakai sebagai waktu generate terakhir saat MoM dibuat ulang.

## 6. API

| Method | Endpoint | Akses | Fungsi |
|---|---|---|---|
| POST | `/v1/meetings/{id}/mom` | organizer/admin/PM | buat / buat ulang MoM |
| GET | `/v1/meetings/{id}/mom` | semua user | unduh DOCX (stream) |

`POST` mengembalikan detail meeting (termasuk `mom`). Detail/list meeting
menyertakan:

```json
"mom": {
  "file_name": "MoM_PRJ-001_2026-11-20_kickoff-proyek.docx",
  "size_bytes": 17250,
  "generated_at": "2026-11-19T08:38:53.427Z",
  "generated_by": { "id": "…", "name": "Admin PriVis" }
}
```

Audit: `meeting.mom_generated` / `meeting.mom_regenerated`.

## 7. Flutter (`features/meeting_calendar`)

- `MeetingEntity.mom` (`MeetingMomEntity?`) + `MeetingDto.mom` + mapping model.
- Repository/datasource/usecase: `generateMom(id)` dan `downloadMom(id)`.
- Detail meeting menampilkan section **Notulen (MoM)**:
  - Belum ada + boleh generate → tombol **Buat MoM**.
  - Sudah ada → kartu berisi nama file, ukuran, tanggal WIB, pembuat, tombol
    **Unduh** dan **Buat Ulang** (konfirmasi dialog).
  - User non-organizer/non-PM/admin hanya melihat info + Unduh.
- Unduh: bytes → file sementara → `OpenFilex.open` (pola document vault).
- Setelah generate, `meetingDetailProvider` di-invalidate.

## 8. Edge case

- Meeting tanpa proyek/klien → field diisi `-`, nama file memakai `UMUM`.
- Judul dengan `&`, `<`, `>` → di-escape, aman dibuka di Word.
- Meeting batal → tombol buat/buat ulang disembunyikan; unduh tetap tersedia.
- Regenerate → file lama dihapus dari MinIO setelah metadata diperbarui.
- Template berubah → unit test `mom-document.spec.ts` gagal jika placeholder
  hilang, sehingga ketahuan sebelum deploy.

## 9. Testing

Backend (`vitest`):

- `mom-document.spec.ts` — 7 field terisi, placeholder hilang, bagian lain
  kosong, escaping XML, jumlah entry zip & XML valid, file bukan DOCX ditolak.
- `mom-fields.spec.ts` — konversi WIB (termasuk lewat tengah malam), tempat
  online/onsite, fallback `-`, nama file.
- Smoke test manual: login admin → buat meeting → POST MoM → unduh → isi benar;
  QA `POST` → 403, `GET` → 200.

Flutter (`flutter test`):

- Admin melihat tombol Buat MoM dan memicu generate.
- QA tidak melihat aksi generate.
- Meeting dengan MoM menampilkan nama file, Unduh, dan Buat Ulang.

## 10. Acceptance criteria

- [x] Tombol Buat MoM tersedia untuk organizer/admin/PM pada meeting valid.
- [x] File DOCX mengikuti template resmi dengan 7 field Bagian 1 terisi.
- [x] Tanggal dan jam memakai WIB.
- [x] Peserta, agenda, pembahasan, dan tanda tangan tetap kosong.
- [x] Karakter khusus aman dan file tidak corrupt.
- [x] File tersimpan privat di MinIO dan bisa diunduh ulang.
- [x] Generate ulang mengganti file dan tercatat di audit.
- [x] `flutter analyze`, `flutter test`, backend build/lint/test lulus.

## 11. Catatan lanjutan

- Jika nanti peserta/agenda ingin terisi otomatis, template perlu diubah agar
  barisnya bisa di-loop; pengisian saat ini sengaja hanya menyentuh paragraf
  placeholder.
- Menambah field baru di template cukup menambah entri di
  `FIELD_BY_PLACEHOLDER` dan nilai di `MomFields`.
