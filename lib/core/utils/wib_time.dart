/// Konversi waktu WIB (UTC+7, tanpa DST).
///
/// Server menyimpan waktu dalam UTC. Aplikasi menampilkan dan menerima input
/// dalam WIB agar konsisten untuk seluruh tim di Indonesia.
const wibOffset = Duration(hours: 7);

/// UTC instant -> wall clock WIB (field DateTime berisi jam WIB).
DateTime toWib(DateTime value) => value.toUtc().add(wibOffset);

/// Wall clock WIB (dari date/time picker) -> UTC instant.
DateTime wibWallClockToUtc(DateTime value) => DateTime.utc(
  value.year,
  value.month,
  value.day,
  value.hour,
  value.minute,
).subtract(wibOffset);

/// Tanggal WIB tanpa komponen jam, untuk grouping kalender.
DateTime wibDateOnly(DateTime value) {
  final wib = toWib(value);
  return DateTime(wib.year, wib.month, wib.day);
}

/// Tanggal hari ini menurut WIB.
DateTime todayWib() {
  final wib = toWib(DateTime.now());
  return DateTime(wib.year, wib.month, wib.day);
}
