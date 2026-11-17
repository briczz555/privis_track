import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/utils/wib_time.dart';

void main() {
  test('WIB wall clock dikonversi ke UTC dengan offset 7 jam', () {
    final utc = wibWallClockToUtc(DateTime(2026, 11, 20, 9, 0));
    expect(utc, DateTime.utc(2026, 11, 20, 2, 0));

    final wib = toWib(utc);
    expect(wib.hour, 9);
    expect(wib.day, 20);
  });

  test('meeting malam WIB tetap pada tanggal WIB yang benar', () {
    final utc = DateTime.utc(2026, 11, 19, 17, 30); // 00:30 WIB tanggal 20
    final date = wibDateOnly(utc);

    expect(date, DateTime(2026, 11, 20));
    expect(toWib(utc).hour, 0);
    expect(toWib(utc).minute, 30);
  });
}
