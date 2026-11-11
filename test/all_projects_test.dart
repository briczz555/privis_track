import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:privis_track/features/dashboard/presentation/screens/all_projects_screen.dart';
import 'package:privis_track/features/project_tracking/presentation/providers/project_tracking_provider.dart';
import 'package:privis_track/main.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

Widget _scope({required Widget child}) => ProviderScope(
  overrides: [
    authRepositoryProvider.overrideWith(
      (ref) => FakeAuthRepository(session: testSession),
    ),
    dashboardRepositoryProvider.overrideWith(
      (ref) => FakeDashboardRepository(
        dashboard: testDashboard,
        projectList: testProjectList,
      ),
    ),
    projectTrackingRepositoryProvider.overrideWith(
      (ref) => FakeProjectTrackingRepository(testTracking),
    ),
  ],
  child: child,
);

Widget _app(Widget home) => _scope(
  child: MaterialApp(theme: AppTheme.light, home: home),
);

void main() {
  testWidgets('menampilkan proyek apa pun statusnya', (tester) async {
    tester.view.physicalSize = const Size(420, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app(const AllProjectsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Semua Proyek'), findsOneWidget);
    expect(find.text('Semua (3)'), findsOneWidget);
    expect(find.text('Berjalan (1)'), findsOneWidget);
    expect(find.text('Ditunda (1)'), findsOneWidget);
    expect(find.text('Selesai (1)'), findsOneWidget);

    expect(find.text('E-Commerce App'), findsOneWidget);
    expect(find.text('HRIS Internal Portal'), findsOneWidget);
    expect(find.text('Company Profile Website'), findsOneWidget);
  });

  testWidgets('filter status menyaring daftar', (tester) async {
    tester.view.physicalSize = const Size(420, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app(const AllProjectsScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Selesai (1)'));
    await tester.pumpAndSettle();

    expect(find.text('Company Profile Website'), findsOneWidget);
    expect(find.text('E-Commerce App'), findsNothing);
    expect(find.textContaining('1 dari 3 proyek'), findsOneWidget);
  });

  testWidgets('proyek Ditunda bisa dibuka dari Semua Proyek', (tester) async {
    tester.view.physicalSize = const Size(420, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_scope(child: const PriVisApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Lihat semua'));
    await tester.pumpAndSettle();
    expect(find.text('Semua Proyek'), findsOneWidget);

    await tester.tap(find.text('HRIS Internal Portal'));
    await tester.pumpAndSettle();

    expect(find.text('Project Tracking'), findsOneWidget);
    expect(find.text('Timeline SDLC'), findsOneWidget);
  });
}
