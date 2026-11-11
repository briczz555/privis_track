import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/storage/cache_store.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/auth/presentation/screens/login_screen.dart';
import 'package:privis_track/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:privis_track/features/project_tracking/presentation/providers/project_tracking_provider.dart';
import 'package:privis_track/main.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

Widget _app(FakeAuthRepository repository) => ProviderScope(
  overrides: [
    authRepositoryProvider.overrideWith((ref) => repository),
    cacheStoreProvider.overrideWith((ref) => MemorySnapshotCache()),
  ],
  child: MaterialApp(theme: AppTheme.light, home: const LoginScreen()),
);

void main() {
  testWidgets('menampilkan pesan error saat login gagal', (tester) async {
    final repository = FakeAuthRepository(failLogin: true);

    await tester.pumpWidget(_app(repository));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'admin@privis.id');
    await tester.enterText(find.byType(TextFormField).last, 'password-salah');
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Email atau password salah.'), findsOneWidget);
    expect(repository.loginCalls, 1);
  });

  testWidgets('memanggil login sekali saat kredensial valid', (tester) async {
    final repository = FakeAuthRepository();

    await tester.pumpWidget(_app(repository));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'admin@privis.id');
    await tester.enterText(find.byType(TextFormField).last, 'PasswordKuat123!');
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(repository.loginCalls, 1);
    expect(find.text('Email atau password salah.'), findsNothing);
  });

  testWidgets('login sukses mengarahkan ke dashboard lewat router', (
    tester,
  ) async {
    final repository = FakeAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWith((ref) => repository),
          dashboardRepositoryProvider.overrideWith(
            (ref) => FakeDashboardRepository(
              dashboard: testDashboard,
              projectList: testProjectList,
            ),
          ),
          projectTrackingRepositoryProvider.overrideWith(
            (ref) => FakeProjectTrackingRepository(testTracking),
          ),
          cacheStoreProvider.overrideWith((ref) => MemorySnapshotCache()),
        ],
        child: const PriVisApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Masuk ke PriVis Track'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'admin@privis.id');
    await tester.enterText(find.byType(TextFormField).last, 'PasswordKuat123!');
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
