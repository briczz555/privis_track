import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:privis_track/main.dart';

void main() {
  testWidgets('DashboardScreen menampilkan data dummy dari data source', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          home: const DashboardScreen(),
        ),
      ),
    );

    expect(find.text('Memuat dashboard...'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Portofolio Proyek'), findsOneWidget);
    expect(find.text('E-Commerce App'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsWidgets);

    // Section aktivitas berada di bawah viewport, jadi perlu di-scroll dulu.
    await tester.scrollUntilVisible(find.text('Aktivitas Tim'), 250);
    expect(find.text('Aktivitas Tim'), findsOneWidget);
  });

  testWidgets('PriVisApp membuka dashboard lewat GoRouter di path /', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: PriVisApp()));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('tap proyek di dashboard membuka project tracking', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: PriVisApp()));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    await tester.tap(find.text('E-Commerce App').first);
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Project Tracking'), findsOneWidget);
    expect(find.text('Timeline SDLC'), findsOneWidget);
    expect(find.text('Discovery & Brief'), findsOneWidget);
  });

  testWidgets('layout dashboard aman di layar sempit 320dp', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          home: const DashboardScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Portofolio Proyek'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Aktivitas Tim'), 250);
    expect(tester.takeException(), isNull);
  });
}
