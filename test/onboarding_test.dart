import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/storage/cache_store.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:privis_track/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:privis_track/features/project_tracking/presentation/providers/project_tracking_provider.dart';
import 'package:privis_track/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

Widget _app({required bool seen}) => ProviderScope(
  overrides: [
    authRepositoryProvider.overrideWith((ref) => FakeAuthRepository()),
    cacheStoreProvider.overrideWith((ref) => MemorySnapshotCache()),
    dashboardRepositoryProvider.overrideWith(
      (ref) => FakeDashboardRepository(
        dashboard: testDashboard,
        projectList: testProjectList,
      ),
    ),
    projectTrackingRepositoryProvider.overrideWith(
      (ref) => FakeProjectTrackingRepository(testTracking),
    ),
    initialOnboardingSeenProvider.overrideWithValue(seen),
  ],
  child: const PriVisApp(),
);

Future<void> _pumpApp(WidgetTester tester, {required bool seen}) async {
  tester.view.physicalSize = const Size(420, 900);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(_app(seen: seen));
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('onboarding tampil saat pertama kali dibuka', (tester) async {
    await _pumpApp(tester, seen: false);

    expect(find.text('Lacak 8 Tahap SDLC'), findsOneWidget);
    expect(find.text('Lewati'), findsOneWidget);
    expect(find.text('Lanjut'), findsOneWidget);
  });

  testWidgets('Lanjut berpindah halaman lalu Mulai membuka login', (
    tester,
  ) async {
    await _pumpApp(tester, seen: false);

    await tester.tap(find.text('Lanjut'));
    await tester.pumpAndSettle();
    expect(find.text('Arsip & Kolaborasi'), findsOneWidget);

    await tester.tap(find.text('Lanjut'));
    await tester.pumpAndSettle();
    expect(find.text('Jadwal Meeting Real-Time'), findsOneWidget);
    expect(find.text('Mulai'), findsOneWidget);

    await tester.tap(find.text('Mulai'));
    await tester.pumpAndSettle();

    expect(find.text('Masuk ke PriVis Track'), findsOneWidget);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(onboardingSeenKey), isTrue);
  });

  testWidgets('Lewati langsung membuka login', (tester) async {
    await _pumpApp(tester, seen: false);

    await tester.tap(find.text('Lewati'));
    await tester.pumpAndSettle();

    expect(find.text('Masuk ke PriVis Track'), findsOneWidget);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(onboardingSeenKey), isTrue);
  });

  testWidgets('onboarding tidak tampil lagi setelah pernah dilihat', (
    tester,
  ) async {
    await _pumpApp(tester, seen: true);

    expect(find.text('Lacak 8 Tahap SDLC'), findsNothing);
    expect(find.text('Masuk ke PriVis Track'), findsOneWidget);
  });

  testWidgets('onboarding aman di layar landscape tanpa overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(900, 420);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app(seen: false));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Lacak 8 Tahap SDLC'), findsOneWidget);
    expect(find.text('Lanjut'), findsOneWidget);
  });
}
