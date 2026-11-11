import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/domain/entities/auth_role.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/entities/auth_user_entity.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/user_management/presentation/providers/user_management_provider.dart';
import 'package:privis_track/features/user_management/presentation/screens/user_management_screen.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

AuthSessionEntity _sessionFor(AuthRole role) {
  final isAdmin = role == AuthRole.admin;
  return AuthSessionEntity(
    accessToken: 'test-access-token',
    refreshToken: 'test-refresh-token',
    expiresAt: DateTime.utc(2030, 1, 1),
    user: AuthUserEntity(
      id: isAdmin ? 'user-1' : 'user-2',
      name: isAdmin ? 'Admin PriVis' : 'Rina PM',
      email: isAdmin ? 'admin@privis.id' : 'rina@privis.id',
      role: role,
      division: isAdmin ? 'Management' : 'PM',
    ),
  );
}

Widget _app({
  AuthRole role = AuthRole.admin,
  FakeUserManagementRepository? repository,
}) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWith(
        (ref) => FakeAuthRepository(session: _sessionFor(role)),
      ),
      userManagementRepositoryProvider.overrideWith(
        (ref) => repository ?? FakeUserManagementRepository(testManagedUsers),
      ),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      home: const UserManagementScreen(),
    ),
  );
}

Future<void> _pumpScreen(
  WidgetTester tester, {
  AuthRole role = AuthRole.admin,
  FakeUserManagementRepository? repository,
}) async {
  tester.view.physicalSize = const Size(420, 1000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(_app(role: role, repository: repository));
  await tester.pumpAndSettle();
}

void main() {
  group('UserManagementScreen', () {
    testWidgets('admin melihat daftar user dan statusnya', (tester) async {
      await _pumpScreen(tester);

      expect(find.text('Kelola User'), findsOneWidget);
      expect(find.text('3 user'), findsOneWidget);
      expect(find.text('2 aktif'), findsOneWidget);
      expect(find.text('Rina PM'), findsOneWidget);
      expect(find.text('Anda'), findsOneWidget);
      expect(find.text('Nonaktif'), findsOneWidget);
      expect(find.text('Tambah User'), findsOneWidget);
    });

    testWidgets('non-admin melihat halaman akses ditolak', (tester) async {
      await _pumpScreen(tester, role: AuthRole.qa);

      expect(find.text('Akses ditolak'), findsOneWidget);
      expect(find.text('Tambah User'), findsNothing);
    });

    testWidgets('validasi form tambah user', (tester) async {
      await _pumpScreen(tester);

      await tester.tap(find.text('Tambah User'));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(FilledButton, 'Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Nama wajib diisi.'), findsOneWidget);
      expect(find.text('Email wajib diisi.'), findsOneWidget);
      expect(find.text('Password wajib diisi.'), findsOneWidget);
    });

    testWidgets('admin dapat menambah user baru', (tester) async {
      final repository = FakeUserManagementRepository(testManagedUsers);
      await _pumpScreen(tester, repository: repository);

      await tester.tap(find.text('Tambah User'));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama lengkap'),
        'Budi Baru',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'budi.baru@privis.id',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password awal'),
        'BaruUser123!',
      );

      await tester.tap(find.widgetWithText(FilledButton, 'Simpan'));
      await tester.pumpAndSettle();

      expect(repository.createCalls, 1);
      expect(find.text('User baru ditambahkan.'), findsOneWidget);
      expect(find.text('Budi Baru'), findsOneWidget);
    });
  });
}
