import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/domain/entities/auth_role.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/entities/auth_user_entity.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:privis_track/features/meeting_calendar/presentation/providers/meeting_provider.dart';
import 'package:privis_track/features/meeting_calendar/presentation/screens/calendar_screen.dart';
import 'package:privis_track/features/meeting_calendar/presentation/screens/meeting_detail_screen.dart';
import 'package:privis_track/features/meeting_calendar/presentation/screens/meeting_form_screen.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

AuthSessionEntity _sessionFor(AuthRole role) {
  final isAdmin = role == AuthRole.admin;
  return AuthSessionEntity(
    accessToken: 'test-access-token',
    refreshToken: 'test-refresh-token',
    expiresAt: DateTime.utc(2030, 1, 1),
    user: AuthUserEntity(
      id: isAdmin ? 'user-1' : 'user-3',
      name: isAdmin ? 'Admin PriVis' : 'QA User',
      email: isAdmin ? 'admin@privis.id' : 'qa@privis.id',
      role: role,
      division: isAdmin ? 'Management' : 'QA',
    ),
  );
}

Widget _app({
  required Widget home,
  AuthRole role = AuthRole.admin,
  FakeMeetingRepository? meetingRepository,
}) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWith(
        (ref) => FakeAuthRepository(session: _sessionFor(role)),
      ),
      meetingRepositoryProvider.overrideWith(
        (ref) =>
            meetingRepository ??
            FakeMeetingRepository(
              meetings: [testMeeting],
              userOptions: testMeetingUsers,
            ),
      ),
      dashboardRepositoryProvider.overrideWith(
        (ref) => FakeDashboardRepository(
          dashboard: testDashboard,
          projectList: testProjectList,
        ),
      ),
    ],
    child: MaterialApp(theme: AppTheme.light, home: home),
  );
}

Future<void> _pumpScreen(
  WidgetTester tester, {
  required Widget home,
  AuthRole role = AuthRole.admin,
  FakeMeetingRepository? meetingRepository,
}) async {
  tester.view.physicalSize = const Size(420, 1000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    _app(home: home, role: role, meetingRepository: meetingRepository),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('MeetingCalendar', () {
    testWidgets('kalender menampilkan meeting pada tanggal terpilih', (
      tester,
    ) async {
      await _pumpScreen(tester, home: const CalendarScreen());

      expect(find.text('Kalender'), findsOneWidget);
      expect(find.text('Meeting Mingguan'), findsOneWidget);
      expect(find.text('Online'), findsWidgets);
      expect(find.text('PRJ-001 · E-Commerce App'), findsOneWidget);
      expect(find.text('Meeting Baru'), findsOneWidget);
    });

    testWidgets('form memvalidasi judul wajib', (tester) async {
      await _pumpScreen(tester, home: const MeetingFormScreen());

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Judul meeting wajib diisi.'), findsOneWidget);
    });

    testWidgets('form membuat meeting dan mengirim peserta', (tester) async {
      final repository = FakeMeetingRepository(
        meetings: [testMeeting],
        userOptions: testMeetingUsers,
      );
      await _pumpScreen(
        tester,
        home: const MeetingFormScreen(),
        meetingRepository: repository,
      );

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Judul meeting'),
        'Meeting Baru Uji',
      );
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(repository.createCalls, 1);
      expect(repository.lastInput?.title, 'Meeting Baru Uji');
      expect(repository.lastInput?.participantIds, contains('user-1'));
    });

    testWidgets('detail menampilkan peserta dan aksi edit untuk admin', (
      tester,
    ) async {
      await _pumpScreen(
        tester,
        home: MeetingDetailScreen(id: 'meeting-1', initial: testMeeting),
      );

      expect(find.text('Meeting Mingguan'), findsOneWidget);
      expect(find.text('Peserta (2)'), findsOneWidget);
      expect(find.textContaining('Admin PriVis'), findsWidgets);
      expect(find.byTooltip('Edit meeting'), findsOneWidget);
    });

    testWidgets('user yang bukan organizer tidak melihat aksi edit', (
      tester,
    ) async {
      await _pumpScreen(
        tester,
        home: MeetingDetailScreen(id: 'meeting-1', initial: testMeeting),
        role: AuthRole.qa,
      );

      expect(find.byTooltip('Edit meeting'), findsNothing);
      expect(find.byTooltip('Batalkan meeting'), findsNothing);
    });
  });
}
