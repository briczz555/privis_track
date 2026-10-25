import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/utils/date_formatter.dart';

void main() {
  test('formatShortDate dan formatLongDate memakai nama bulan Indonesia', () {
    final date = DateTime(2026, 10, 26);

    expect(formatShortDate(date), '26 Okt 2026');
    expect(formatDayMonth(date), '26 Okt');
    expect(formatLongDate(date), 'Senin, 26 Oktober 2026');
  });

  test('formatRelativeTime menghitung selisih waktu', () {
    final now = DateTime(2026, 10, 26, 12);

    expect(
      formatRelativeTime(now.subtract(const Duration(seconds: 20)), now: now),
      'baru saja',
    );
    expect(
      formatRelativeTime(now.subtract(const Duration(minutes: 45)), now: now),
      '45 menit lalu',
    );
    expect(
      formatRelativeTime(now.subtract(const Duration(hours: 3)), now: now),
      '3 jam lalu',
    );
    expect(
      formatRelativeTime(now.subtract(const Duration(days: 2)), now: now),
      '2 hari lalu',
    );
    expect(
      formatRelativeTime(now.subtract(const Duration(days: 10)), now: now),
      '1 minggu lalu',
    );
  });
}
