import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:privis_track/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:privis_track/features/meeting_calendar/presentation/providers/meeting_provider.dart';
import 'package:privis_track/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:privis_track/features/project_tracking/presentation/providers/project_tracking_provider.dart';
import 'package:privis_track/main.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

Widget _scope({
  required Widget child,
  FakeMeetingRepository? meetingRepository,
}) => ProviderScope(
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
    meetingRepositoryProvider.overrideWith(
      (ref) =>
          meetingRepository ??
          FakeMeetingRepository(
            meetings: [testMeeting],
            userOptions: testMeetingUsers,
          ),
    ),
    initialOnboardingSeenProvider.overrideWithValue(true),
  ],
  child: child,
);

Widget _app(Widget home) => _scope(
  child: MaterialApp(theme: AppTheme.light, home: home),
);

void main() {
  testWidgets('DashboardScreen menampilkan data dari repository', (
    tester,
  ) async {
    await tester.pumpWidget(_app(const DashboardScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Portofolio Proyek'), findsOneWidget);
    expect(find.text('Meeting Hari Ini'), findsOneWidget);
    expect(find.text('Meeting Mingguan'), findsOneWidget);
    expect(find.text('E-Commerce App'), findsOneWidget);
    expect(find.text('Lihat semua'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsWidgets);

    await tester.scrollUntilVisible(find.text('Aktivitas Tim'), 250);
    expect(find.text('Aktivitas Tim'), findsOneWidget);
  });

  testWidgets('PriVisApp memulihkan sesi lalu membuka dashboard', (
    tester,
  ) async {
    await tester.pumpWidget(_scope(child: const PriVisApp()));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('tap proyek membuka project tracking', (tester) async {
    await tester.pumpWidget(_scope(child: const PriVisApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('E-Commerce App').first);
    await tester.pumpAndSettle();

    expect(find.text('Project Tracking'), findsOneWidget);
    expect(find.text('Timeline SDLC'), findsOneWidget);
    expect(find.text('Discovery & Brief'), findsOneWidget);
  });

  testWidgets('dashboard membatasi daftar meeting hari ini', (tester) async {
    tester.view.physicalSize = const Size(420, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final meetings = [
      for (var index = 0; index < 4; index++)
        testMeeting.copyWith(
          id: 'meeting-$index',
          title: 'Meeting ${index + 1}',
        ),
    ];

    await tester.pumpWidget(
      _scope(
        meetingRepository: FakeMeetingRepository(
          meetings: meetings,
          userOptions: testMeetingUsers,
        ),
        child: MaterialApp(
          theme: AppTheme.light,
          home: const DashboardScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Meeting Hari Ini'), findsOneWidget);
    expect(find.text('Meeting 1'), findsOneWidget);
    expect(find.text('Meeting 3'), findsOneWidget);
    expect(find.text('Meeting 4'), findsNothing);
    expect(find.text('1 meeting lainnya'), findsOneWidget);
  });

  testWidgets('layout dashboard aman di layar sempit 320dp', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app(const DashboardScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Portofolio Proyek'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Aktivitas Tim'), 250);
    expect(tester.takeException(), isNull);
  });
}
