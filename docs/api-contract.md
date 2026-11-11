# PriVis Track — API Contract (Draft Fase 2)

**Status:** Draft — auth, endpoint baca, dokumen (upload/download/hapus), PATCH proyek/tahap, ganti password, serta hardening (rate limit, Swagger, magic-bytes, akun layanan MinIO) sudah diimplementasikan di `privis_track_api` (11 Nov 2026).
**Versi API:** `v1` (status: Fase 2, sudah diimplementasikan)
**Kontrak mesin:** [`openapi.yaml`](openapi.yaml) (OpenAPI 3.0.3)

## Status implementasi

| Bagian | Status |
|---|---|
| Auth (`login`, `refresh`, `logout`, `me`) | ✅ |
| `POST /auth/change-password` | ✅ |
| `GET /dashboard`, `GET /projects`, `GET /projects/{code}`, `GET /activities` | ✅ |
| `PATCH /projects/{code}`, `PATCH .../stages/{stage_no}` | ✅ |
| Upload/download/hapus dokumen | ✅ |
| Manajemen user (admin) | ✅ |
| Buat/edit proyek & kontak klien | ✅ |
| Swagger runtime (`/docs`) & rate limit aplikasi | ✅ |

## Keputusan desain (disetujui)

1. **Unduh dokumen via API (stream)** — MinIO tetap internal, tidak diekspos ke publik.
2. **Identifier proyek di URL memakai `code`** (`PRJ-001`); UUID tetap primary key internal.
3. **Progres dihitung dari jumlah tahap selesai** (`completed_stages / 8`), bukan `current_stage`.

---

## 1. Prinsip umum

| Aspek | Ketentuan |
|---|---|
| Format | JSON, `Content-Type: application/json` (upload `multipart/form-data`, download binary) |
| Penamaan field | `snake_case` (selaras dengan DTO Freezed saat ini) |
| Waktu | ISO-8601 UTC, contoh `2026-11-06T09:15:00Z` |
| Tanggal | `due_date` date-only (`YYYY-MM-DD`), ditampilkan dalam zona Asia/Jakarta |
| ID publik proyek | `code` (`PRJ-001`), unik & immutable |
| ID internal | UUID v4 (tidak dipakai di URL proyek) |
| Versi | Prefix path `/v1`; breaking change → `/v2` |
| Auth | Bearer JWT (access 15 menit, refresh 7 hari, rotasi) |
| Rate limit | 120 req/menit per user; login 5 percobaan/menit per IP |
| Header respons | `X-Request-Id` untuk tracing |
| Cache | Auth & dashboard `Cache-Control: no-store`; API lain `no-store` kecuali disepakati |

## 2. Environment & topologi deployment

| Env | Base URL |
|---|---|
| Development | `http://localhost:3000/v1` |
| Production | `https://privis.briczz.my.id/v1` |

Health: `https://privis.briczz.my.id/health` · Swagger (jika ada): `https://privis.briczz.my.id/docs` (dibatasi).

```
Internet
  │ HTTPS (Cloudflare edge, privis.briczz.my.id)
  ▼
Cloudflare Tunnel (cloudflared)
  │ http://npm:80
  ▼
Nginx Proxy Manager (default + proxy-net)
  │ http://privis-track-api:3000
  ▼
API NestJS (default + proxy-net)
  ├── PostgreSQL (internal)
  └── MinIO (internal, tanpa akses publik)
```

Konfigurasi yang menyertai kontrak ini:

- **Cloudflare Tunnel**: public hostname `privis.briczz.my.id` → service `http://npm:80`.
- **NPM**: proxy host `privis.briczz.my.id` → `http://privis-track-api:3000`, Block Common Exploits ON, Websockets OFF, `client_max_body_size 25m;`, `proxy_read_timeout 120s;`, **Force SSL OFF**.
- **API container**: `container_name: privis-track-api`, join network eksternal `proxy-net`, tidak mem-publish port publik (hanya `127.0.0.1:3000` untuk debug).
- **Cloudflare**: Always Use HTTPS ON, SSL/TLS mode Full, cache bypass untuk `/v1/*`.
- **MinIO**: hanya jaringan internal; console diakses via SSH tunnel, bukan NPM.
- **Trust proxy**: backend membaca `CF-Connecting-IP` / `X-Forwarded-For` untuk rate limit & logging.

## 3. Role & otorisasi

| Role | Hak akses |
|---|---|
| `admin` | Semua endpoint, kelola user |
| `pm` | Data proyek, buat/edit proyek & klien, ubah status/tahap, hapus dokumen |
| `developer` | Baca proyek/tahap/dokumen, unggah dokumen teknis |
| `qa` | Baca proyek/tahap/dokumen, unggah dokumen QA/UAT |
| `finance` | Baca proyek, unggah dokumen finance |

Tidak ada registrasi publik dan tidak ada akses klien.

## 4. Resource & enum

**ProjectStatus:** `not_started` · `in_progress` · `on_hold` · `completed`
**DocumentType:** `pdf` · `spreadsheet` · `image` · `design` · `document` · `other`
**ActivityType:** `project_created` · `project_updated` · `stage_completed` · `stage_reopened` · `document_uploaded` · `document_deleted`
**Tahap SDLC:** nomor `1..8`; judul mengikuti `core/constants/sdlc_stages.dart`.

### Semantik progres

- `completed_stages` = jumlah tahap dengan `is_completed = true` (0..8).
- `progress_percent` = `round(completed_stages / 8 * 100)` (0..100).
- `current_stage` = 0 jika proyek belum mulai; selain itu nomor tahap belum selesai **terkecil** (1..8), dan 8 jika semua selesai.
- `current_stage_title` mengikuti nomor tersebut.
- Saat tahap diselesaikan/dibuka kembali, server menghitung ulang ketiga nilai di atas dan mencatat aktivitas.
- Jika semua tahap selesai, `status` otomatis menjadi `completed`; membuka kembali tahap mengubah status menjadi `in_progress`.
- `PATCH /projects/{code}` dapat mengubah status manual (mis. `on_hold`) tanpa mengubah `completed_stages`.

> Catatan migrasi: aplikasi saat ini menghitung `current_stage / 8`. Saat wiring, gunakan `progress_percent` dari server (atau `completed_stages`) agar konsisten dengan no-step-lock.

## 5. Format error

```json
{
  "error": {
    "code": "validation_error",
    "message": "Ukuran file melebihi batas.",
    "details": {
      "max_mb": 20,
      "fields": [{ "field": "file", "message": "Maksimum 20 MB" }]
    },
    "request_id": "01J8Z9V6K3Q7M2T4R5X1N8B0C2"
  }
}
```

| HTTP | `code` | Kapan |
|---|---|---|
| 400 | `bad_request` | Body/query tidak valid |
| 401 | `unauthorized` | Token tidak ada/kedaluwarsa |
| 403 | `forbidden` | Role tidak punya akses |
| 404 | `not_found` | Resource tidak ada / dokumen sudah dihapus |
| 409 | `conflict` | Duplikat kode proyek |
| 413 | `payload_too_large` | File melebihi batas |
| 415 | `unsupported_media_type` | MIME/ekstensi tidak diizinkan |
| 422 | `validation_error` | Field tidak lolos validasi |
| 429 | `rate_limited` | Melebihi rate limit (sertakan `Retry-After`) |
| 500 | `internal_error` | Kesalahan server |

## 6. Endpoint

### 6.1 Auth

- `POST /auth/login` `{email, password}` → `AuthTokens` (access 900 detik, refresh 604800 detik).
- `POST /auth/refresh` `{refresh_token}` → rotasi token; token lama dicabut; deteksi reuse → 401.
- `POST /auth/logout` `{refresh_token}` → 204.
- `POST /auth/change-password` `{current_password, new_password}` → `AuthTokens` baru; semua refresh token lama dicabut. Password salah → 400 `bad_request`.
- `GET /me` → `User`.

Refresh token disimpan sebagai hash di server; aplikasi menyimpan token di secure storage. Respons auth `Cache-Control: no-store`.

### 6.2 Dashboard

`GET /dashboard` → satu request untuk chart, proyek berjalan, dan aktivitas:

```json
{
  "generated_at": "2026-11-06T09:15:00Z",
  "total_projects": 8,
  "portfolio": [
    { "status": "in_progress", "count": 4, "percentage": 50 },
    { "status": "on_hold", "count": 1, "percentage": 12.5 },
    { "status": "not_started", "count": 1, "percentage": 12.5 },
    { "status": "completed", "count": 2, "percentage": 25 }
  ],
  "active_projects": [
    {
      "id": "0e6b1c2a-...",
      "code": "PRJ-001",
      "name": "E-Commerce App",
      "client": { "id": "a1b2...", "name": "PT. ABC Retail" },
      "status": "in_progress",
      "current_stage": 4,
      "current_stage_title": "Development",
      "completed_stages": 3,
      "progress_percent": 38,
      "document_count": 7,
      "due_date": "2026-11-20",
      "updated_at": "2026-11-05T10:12:00Z"
    }
  ],
  "activities": [
    {
      "id": "b7d2...",
      "type": "document_uploaded",
      "actor": { "id": "u-1", "name": "Finance", "division": "Finance" },
      "action": "mengunggah",
      "target": "BAST 1",
      "project": { "id": "0e6b...", "code": "PRJ-001", "name": "E-Commerce App" },
      "created_at": "2026-11-06T07:12:00Z"
    }
  ]
}
```

Batasan: `active_projects` maksimum 10 (urut `due_date` terdekat), `activities` maksimum 10 (terbaru). `portfolio` selalu memuat keempat status (count 0 jika kosong).

### 6.3 Projects

#### `GET /clients`

Daftar klien yang sudah ada (`id`, `name`), urut nama. Dipakai untuk dropdown saat membuat proyek. Semua user terautentikasi.

#### `POST /projects`

Role `admin`/`pm`. Body:

```json
{
  "name": "Aplikasi Baru",
  "start_date": "2026-11-12",
  "due_date": "2027-01-31",
  "client_id": "a1b2..."
}
```

atau buat klien baru sekaligus:

```json
{
  "name": "Aplikasi Baru",
  "client": {
    "name": "PT Klien Baru",
    "address": "Jl. Contoh No. 1",
    "contact_name": "Dewi",
    "contact_role": "Manager",
    "phone": "+62 812-0000-0000"
  }
}
```

- `client_id` dan `client` tidak boleh diisi bersamaan.
- Kode `PRJ-###` dibuat otomatis; 8 tahap SDLC langsung dibuat.
- Status awal `not_started`, `current_stage` 0; `due_date` tidak boleh sebelum `start_date`.
- Tercatat sebagai aktivitas `project_created`.
- Respons `201` ProjectDetail.

#### `GET /projects`

Query: `status`, `search`, `client_id`, `page` (default 1), `limit` (default 20, max 100), `sort` (default `updated_at:desc`). Urutan wajib punya tiebreaker `id` agar pagination stabil.

```json
{
  "data": [ { "...": "ProjectSummary" } ],
  "meta": { "page": 1, "limit": 20, "total": 8, "total_pages": 1 }
}
```

`ProjectSummary`:

```json
{
  "id": "0e6b1c2a-...",
  "code": "PRJ-001",
  "name": "E-Commerce App",
  "client": { "id": "a1b2...", "name": "PT. ABC Retail" },
  "status": "in_progress",
  "current_stage": 4,
  "current_stage_title": "Development",
  "completed_stages": 3,
  "progress_percent": 38,
  "document_count": 7,
  "start_date": "2026-10-01",
  "due_date": "2026-11-20",
  "updated_at": "2026-11-05T10:12:00Z"
}
```

#### `GET /projects/{project_code}`

Contoh: `/projects/PRJ-001`. Respons `ProjectDetail` (8 tahap + dokumen di-embed):

```json
{
  "id": "0e6b1c2a-...",
  "code": "PRJ-001",
  "name": "E-Commerce App",
  "client": {
    "id": "a1b2...",
    "name": "PT. ABC Retail",
    "address": "Jl. Jenderal Sudirman Kav. 52-53, Jakarta Selatan 12190",
    "contact_name": "Dewi Lestari",
    "contact_role": "IT Manager",
    "phone": "+62 812-3456-7890"
  },
  "status": "in_progress",
  "current_stage": 4,
  "current_stage_title": "Development",
  "completed_stages": 3,
  "progress_percent": 38,
  "stages": [
    {
      "stage_no": 1,
      "title": "Discovery & Brief",
      "is_completed": true,
      "completed_at": "2026-10-15T08:00:00Z",
      "document_count": 2,
      "documents": [
        {
          "id": "d-001",
          "name": "MoM Kickoff.pdf",
          "type": "pdf",
          "mime_type": "application/pdf",
          "size_bytes": 245760,
          "uploaded_by": { "id": "u-2", "name": "Rina", "division": "PM" },
          "uploaded_at": "2026-10-14T09:15:00Z"
        }
      ]
    }
  ],
  "start_date": "2026-10-01",
  "due_date": "2026-11-20",
  "updated_at": "2026-11-05T10:12:00Z"
}
```

Dokumen yang sudah dihapus (`deleted_at` terisi) tidak boleh muncul di `documents` maupun `document_count`.

#### `PATCH /projects/{project_code}`

Role `pm`/`admin`. Body (semua opsional, minimal satu field):

```json
{
  "name": "E-Commerce App v2",
  "start_date": "2026-10-01",
  "due_date": "2026-12-01",
  "client": {
    "name": "PT. ABC Retail",
    "address": "Jl. Jenderal Sudirman Kav. 52-53, Jakarta Selatan 12190",
    "contact_name": "Dewi Lestari",
    "contact_role": "IT Manager",
    "phone": "+62 812-3456-7890"
  }
}
```

- `status` mengubah status manual; tidak mengubah `completed_stages`.
- `current_stage` hanya untuk override tampilan tahap aktif (0..8).
- `start_date`/`due_date` boleh `null` untuk menghapus; `due_date` tidak boleh sebelum `start_date`.
- Data `client` bersifat shared: perubahan berlaku untuk semua proyek milik klien tersebut.
- Perubahan dicatat sebagai aktivitas `project_updated`.
- Respons `200` ProjectSummary.

### 6.4 Tahap

#### `PATCH /projects/{project_code}/stages/{stage_no}`

Role `pm`/`admin` (dan `developer` untuk tahap teknis bila disepakati).

```json
{ "is_completed": true }
```

Efek server: set `completed_at`, hitung ulang `completed_stages`, `progress_percent`, `current_stage`; jika semua selesai → `status = completed`; jika dibuka kembali → `status = in_progress`; catat aktivitas `stage_completed` / `stage_reopened`. Tidak ada validasi urutan (no step-lock). Respons `200` ProjectStage.

### 6.5 Dokumen

#### `POST /projects/{project_code}/stages/{stage_no}/documents`

`multipart/form-data`: `file` (wajib, maks 20 MB), `name` (opsional). Header opsional `Idempotency-Key` untuk mencegah duplikat saat retry.

Respons `201` StageDocument. Dokumen langsung dihitung pada `document_count` tahap.

#### `GET /projects/{project_code}/stages/{stage_no}/documents` → `200 { "data": [StageDocument] }`

#### `GET /documents/{document_id}/download` → `200` **binary stream**

Header:

```
Content-Type: application/pdf
Content-Length: 245760
Content-Disposition: attachment; filename*=UTF-8''MoM%20Kickoff.pdf
Accept-Ranges: bytes
```

- Mendukung `Range` → `206 Partial Content` (opsional, disarankan untuk file besar).
- Dokumen terhapus → `404`.
- Tidak ada URL storage yang dikirim ke client; MinIO tetap internal.

#### `DELETE /documents/{document_id}` → `204`

Soft delete (`deleted_at`), role `admin`/`pm` (finance untuk dokumen finance bila disepakati), catat aktivitas `document_deleted`.

### 6.6 User (khusus admin)

Semua endpoint memerlukan Bearer token dengan role `admin`.

- `GET /users` → `200 { "data": [User] }`, urutan user aktif lebih dulu lalu nama.
- `POST /users` `{name, email, password, role, division?}` → `201 User`. Email unik; duplikat → `409 conflict`.
- `PATCH /users/{id}` `{name?, role?, division?, is_active?}` → `200 User`.
  - Admin tidak bisa menonaktifkan atau mengubah role akun sendiri (`400`).
  - Minimal harus tersisa satu admin aktif (`400`).
  - `is_active=false` mencabut seluruh refresh token user tersebut.
- `POST /users/{id}/reset-password` `{new_password}` → `204`; mencabut semua sesi user.
  - Untuk akun sendiri → `400`; gunakan `/auth/change-password`.

`User` = `{id, name, email, role, division, is_active, created_at}`.

### 6.7 Aktivitas

`GET /activities?limit=20&cursor=...` → `{ data: [Activity], next_cursor }`.

- Cursor **opaque** (base64 dari `created_at` + `id`), urutan `created_at desc, id desc`.
- `limit` default 20, maksimum 100.
- `Activity` memuat `type`, `action` (teks tampilan), `target`, `actor`, `project`, `created_at`.

### 6.8 Health

`GET /health` (tanpa `/v1`) → `{ "status": "ok" }`. Tidak menampilkan versi/uptime ke publik.

## 7. Upload & download

- Maksimum 20 MB (`MAX_UPLOAD_MB`), divalidasi juga di NPM (`client_max_body_size 25m`) dan Cloudflare (100 MB free plan).
- Signature file divalidasi dari magic bytes untuk semua tipe: PDF (`%PDF-`), PNG/JPEG, DOC/XLS (container OLE), DOCX/XLSX/FIG (container ZIP). CSV ditolak bila mengandung byte NUL pada bagian awal.
- Isi file yang tidak cocok dengan ekstensinya → `415 unsupported_media_type`.
- Nama file disanitasi; object key memakai UUID; bucket privat.
- Download melalui API (stream), bukan signed URL.
- Opsional lanjutan: antivirus scan sebelum dokumen dapat diunduh.

## 8. Rate limit, proxy, cache

- Rate limit di aplikasi: 120 request/menit/IP untuk seluruh API dan 5 percobaan login/menit/IP.
- Cloudflare WAF (opsional, lapisan tambahan): `/v1/auth/login` 5/menit/IP; `/v1/*` 120/menit/IP.
- Backend memakai `CF-Connecting-IP` (fallback `X-Forwarded-For`) dan `trust proxy`.
- Respons 429 memakai kode `rate_limited` dan menyertakan `Retry-After`.
- Dokumentasi interaktif tersedia di `/docs` (OpenAPI di `/docs-json`); matikan dengan `SWAGGER_ENABLED=false`.
- Cache bypass Cloudflare untuk `/v1/*`; auth & dashboard `no-store`.

## 9. Perubahan yang diperlukan di aplikasi (saat wiring)

1. `AuthInterceptor` membaca access token dari secure storage dan refresh saat 401.
2. Base URL: `--dart-define=API_BASE_URL=https://privis.briczz.my.id/v1`.
3. Proyek memakai `code` di route (`/projects/PRJ-001`) — sudah kompatibel dengan data mock.
4. Gunakan `progress_percent`/`completed_stages` dari server; jangan hitung dari `current_stage`.
5. Status dipetakan dari enum snake_case.
6. `StageDocumentEntity.url` dihapus; unduh via endpoint binary (`ResponseType.bytes` / stream).
7. Dashboard DTO mengikuti bentuk agregat (`portfolio`, `active_projects`, `activities`, `generated_at`).
8. `mapDioException` menangani 403/404/409/413/415/422/429 + parsing `error.code`.
9. Pagination proyek di halaman Semua Proyek.

## 10. Operasional & keamanan

- MinIO & PostgreSQL tidak diekspos publik; console MinIO via SSH tunnel.
- `/docs` dinonaktifkan di produksi atau dilindungi Cloudflare Access (jangan seluruh `/v1`, karena mobile butuh akses langsung).
- PII (alamat/nomor HP PIC) hanya untuk user terautentikasi; jangan dicatat di log.
- Backup offsite harian: `pg_dump` + mirror bucket MinIO (R2/B2), karena server berada di laptop lama.
- Pantau disk, suhu, dan uptime; Cloudflare Tunnel menangani IP dinamis.
- Image MinIO dipin digest (Chainguard); update berkala.

## 11. Di luar cakupan v1

- Notifikasi push, komentar per dokumen, versioning file.
- Multi-tenant.
- Realtime websocket.
- Audit log aksi admin (manajemen user belum masuk activity proyek).
- Restore dokumen yang sudah dihapus.

## 12. Checklist review

- [x] Unduh via stream API (MinIO internal).
- [x] Identifier proyek memakai `code`.
- [x] Progres dari tahap selesai.
- [ ] NPM/Cloudflare dikonfigurasi sesuai bagian 2.
- [x] Batas upload 20 MB & whitelist MIME disetujui.
- [x] Role matrix (hapus dokumen, ubah tahap/status, kelola user).
- [x] `/docs` tersedia; bisa dilindungi Cloudflare Access atau dimatikan.
- [ ] Backup offsite disiapkan.
