import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/dashboard/presentation/screens/all_projects_screen.dart';
import 'package:privis_track/main.dart';

Future<void> _pumpApp(WidgetTester tester, {Widget? home}) async {
  // Viewport tinggi supaya seluruh kartu proyek ter-build tanpa scroll.
  tester.view.physicalSize = const Size(420, 1900);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        theme: AppTheme.light,
        home: home ?? const AllProjectsScreen(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('menampilkan seluruh proyek apa pun statusnya', (tester) async {
    await _pumpApp(tester);

    expect(find.text('Semua Proyek'), findsOneWidget);
    expect(find.text('Semua (8)'), findsOneWidget);
    expect(find.text('Berjalan (4)'), findsOneWidget);
    expect(find.text('Ditunda (1)'), findsOneWidget);
    expect(find.text('Selesai (2)'), findsOneWidget);
    expect(find.text('Belum Mulai (1)'), findsOneWidget);

    for (final name in [
      'E-Commerce App',
      'Mobile Banking Revamp',
      'HRIS Internal Portal',
      'Company Profile Website',
      'Logistics Dashboard',
      'POS Integration',
      'Healthcare Booking System',
      'ERP Customization',
    ]) {
      expect(find.text(name), findsOneWidget);
    }
  });

  testWidgets('filter status menyaring daftar proyek', (tester) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Selesai (2)'));
    await tester.pumpAndSettle();

    expect(find.text('Company Profile Website'), findsOneWidget);
    expect(find.text('ERP Customization'), findsOneWidget);
    expect(find.text('E-Commerce App'), findsNothing);
    expect(find.textContaining('2 dari 8 proyek'), findsOneWidget);

    await tester.tap(find.text('Belum Mulai (1)'));
    await tester.pumpAndSettle();

    expect(find.text('POS Integration'), findsOneWidget);
    expect(find.textContaining('1 dari 8 proyek'), findsOneWidget);
  });

  testWidgets('proyek Ditunda bisa dibuka dari Semua Proyek', (tester) async {
    await _pumpApp(tester, home: const PriVisApp());

    await tester.tap(find.text('Lihat semua'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Semua Proyek'), findsOneWidget);

    await tester.tap(find.text('HRIS Internal Portal'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Project Tracking'), findsOneWidget);
    expect(find.text('HRIS Internal Portal'), findsOneWidget);
    expect(find.text('Timeline SDLC'), findsOneWidget);
  });
}
