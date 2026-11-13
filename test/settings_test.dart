import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/auth/presentation/screens/settings_screen.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

Widget _app() => ProviderScope(
  overrides: [
    authRepositoryProvider.overrideWith(
      (ref) => FakeAuthRepository(session: testSession),
    ),
  ],
  child: MaterialApp(theme: AppTheme.light, home: const SettingsScreen()),
);

Future<void> _pumpScreen(WidgetTester tester) async {
  tester.view.physicalSize = const Size(420, 900);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(_app());
  await tester.pumpAndSettle();
}

void main() {
  group('SettingsScreen', () {
    testWidgets('menampilkan akun dan aksi ganti password', (tester) async {
      await _pumpScreen(tester);

      expect(find.text('Admin PriVis'), findsOneWidget);
      expect(find.text('admin@privis.id'), findsOneWidget);
      expect(find.text('Ganti password'), findsOneWidget);
      expect(find.text('Kelola User'), findsOneWidget);
      expect(find.text('Audit Log'), findsOneWidget);
    });

    testWidgets('validasi konfirmasi password di dialog', (tester) async {
      await _pumpScreen(tester);

      await tester.tap(find.text('Ganti password'));
      await tester.pumpAndSettle();

      expect(find.text('Password saat ini'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password saat ini'),
        'Privis123!',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password baru'),
        'BaruSekali123!',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Ulangi password baru'),
        'BedaSekali123!',
      );

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Konfirmasi password tidak sama.'), findsOneWidget);
    });

    testWidgets('ganti password berhasil menutup dialog', (tester) async {
      await _pumpScreen(tester);

      await tester.tap(find.text('Ganti password'));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password saat ini'),
        'Privis123!',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password baru'),
        'BaruSekali123!',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Ulangi password baru'),
        'BaruSekali123!',
      );

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Password berhasil diubah.'), findsOneWidget);
      expect(find.text('Password saat ini'), findsNothing);
    });
  });
}
