import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/auth/domain/entities/auth_role.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/entities/auth_user_entity.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';
import 'package:privis_track/features/project_management/domain/entities/client_option_entity.dart';
import 'package:privis_track/features/project_management/presentation/providers/project_management_provider.dart';
import 'package:privis_track/features/project_management/presentation/screens/project_form_screen.dart';

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
  required Widget home,
  AuthRole role = AuthRole.admin,
  FakeProjectManagementRepository? repository,
}) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWith(
        (ref) => FakeAuthRepository(session: _sessionFor(role)),
      ),
      projectManagementRepositoryProvider.overrideWith(
        (ref) => repository ?? FakeProjectManagementRepository(),
      ),
    ],
    child: MaterialApp(theme: AppTheme.light, home: home),
  );
}

Future<void> _pumpForm(
  WidgetTester tester, {
  Widget home = const ProjectFormScreen(),
  AuthRole role = AuthRole.admin,
  FakeProjectManagementRepository? repository,
}) async {
  tester.view.physicalSize = const Size(420, 1400);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(_app(home: home, role: role, repository: repository));
  await tester.pumpAndSettle();
}

void main() {
  group('ProjectFormScreen', () {
    testWidgets('non-admin melihat pesan akses', (tester) async {
      await _pumpForm(tester, role: AuthRole.qa);

      expect(find.textContaining('Hanya admin/PM'), findsOneWidget);
    });

    testWidgets('validasi form tambah proyek', (tester) async {
      await _pumpForm(tester);

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Nama proyek wajib diisi.'), findsOneWidget);
      expect(find.text('Nama perusahaan klien wajib diisi.'), findsOneWidget);
      expect(find.text('Nomor WhatsApp PIC wajib diisi.'), findsOneWidget);
    });

    testWidgets('membuat proyek dengan klien baru', (tester) async {
      final repository = FakeProjectManagementRepository();
      await _pumpForm(tester, repository: repository);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama proyek'),
        'Aplikasi Baru',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama perusahaan klien'),
        'PT Klien Baru',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Alamat'),
        'Jl. Baru No. 1',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama PIC'),
        'Dewi',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Jabatan PIC'),
        'Manager',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nomor WhatsApp PIC'),
        '+62 811-2222-3333',
      );

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(repository.createCalls, 1);
      expect(repository.lastCreatedName, 'Aplikasi Baru');
      expect(repository.lastClientId, isNull);
      expect(repository.lastNewClient?.name, 'PT Klien Baru');
    });

    testWidgets('memilih klien yang sudah ada', (tester) async {
      final repository = FakeProjectManagementRepository(
        clients: const [
          ClientOptionEntity(id: 'client-1', name: 'PT Klien Lama'),
        ],
      );
      await _pumpForm(tester, repository: repository);

      await tester.tap(find.text('Klien baru'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('PT Klien Lama').last);
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama proyek'),
        'Aplikasi Existing',
      );
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(repository.createCalls, 1);
      expect(repository.lastClientId, 'client-1');
      expect(repository.lastNewClient, isNull);
    });

    testWidgets('edit proyek memuat data awal dan menyimpan', (tester) async {
      final repository = FakeProjectManagementRepository();
      await _pumpForm(
        tester,
        home: ProjectFormScreen(
          projectCode: 'PRJ-001',
          initialProject: testTracking,
        ),
        repository: repository,
      );

      expect(find.text('Edit Proyek'), findsOneWidget);
      expect(find.text('E-Commerce App'), findsOneWidget);
      expect(find.text('PT. ABC Retail'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama proyek'),
        'E-Commerce App v2',
      );
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(repository.updateCalls, 1);
      expect(repository.lastUpdatedCode, 'PRJ-001');
      expect(repository.lastUpdatedName, 'E-Commerce App v2');
      expect(repository.lastUpdatedClient?.name, 'PT. ABC Retail');
    });
  });
}
