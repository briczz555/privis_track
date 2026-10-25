/// Formatter tanggal berbahasa Indonesia tanpa dependency tambahan.
///
/// Dipakai lintas widget agar format tanggal konsisten dan mudah diuji
/// (parameter [now] bisa diinjeksi pada `formatRelativeTime`).
library;

const _weekdays = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
  'Minggu',
];

const _monthsLong = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

const _monthsShort = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'Mei',
  'Jun',
  'Jul',
  'Agu',
  'Sep',
  'Okt',
  'Nov',
  'Des',
];

/// Contoh: `26 Okt`.
String formatDayMonth(DateTime date) =>
    '${date.day} ${_monthsShort[date.month - 1]}';

/// Contoh: `20 Nov 2026`.
String formatShortDate(DateTime date) =>
    '${date.day} ${_monthsShort[date.month - 1]} ${date.year}';

/// Contoh: `Senin, 26 Oktober 2026`.
String formatLongDate(DateTime date) =>
    '${_weekdays[date.weekday - 1]}, ${date.day} '
    '${_monthsLong[date.month - 1]} ${date.year}';

/// Contoh: `2 jam lalu`, `3 hari lalu`.
String formatRelativeTime(DateTime time, {DateTime? now}) {
  final reference = now ?? DateTime.now();
  final difference = reference.difference(time);
  if (difference.isNegative || difference.inMinutes < 1) return 'baru saja';
  if (difference.inMinutes < 60) return '${difference.inMinutes} menit lalu';
  if (difference.inHours < 24) return '${difference.inHours} jam lalu';
  if (difference.inDays < 7) return '${difference.inDays} hari lalu';
  return '${(difference.inDays / 7).floor()} minggu lalu';
}
