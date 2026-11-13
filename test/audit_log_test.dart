import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/audit_log/presentation/providers/audit_log_provider.dart';
import 'package:privis_track/features/audit_log/presentation/screens/audit_log_screen.dart';
import 'package:privis_track/features/auth/domain/entities/auth_role.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/entities/auth_user_entity.dart';
import 'package:privis_track/features/auth/presentation/providers/auth_controller.dart';

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

Future<void> _pumpScreen(
  WidgetTester tester, {
  AuthRole role = AuthRole.admin,
}) async {
  tester.view.physicalSize = const Size(420, 1000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          (ref) => FakeAuthRepository(session: _sessionFor(role)),
        ),
        auditLogRepositoryProvider.overrideWith(
          (ref) => FakeAuditLogRepository(testAuditLogPage),
        ),
      ],
      child: MaterialApp(theme: AppTheme.light, home: const AuditLogScreen()),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('AuditLogScreen', () {
    testWidgets('admin melihat riwayat aksi', (tester) async {
      await _pumpScreen(tester);

      expect(find.text('Audit Log'), findsOneWidget);
      expect(find.text('2 aktivitas'), findsOneWidget);
      expect(
        find.text('membuat user Budi Baru (budi@privis.id)'),
        findsOneWidget,
      );
      expect(find.text('User baru'), findsOneWidget);
      expect(find.text('Ubah proyek'), findsOneWidget);
      expect(find.textContaining('Admin PriVis'), findsWidgets);
    });

    testWidgets('non-admin melihat akses ditolak', (tester) async {
      await _pumpScreen(tester, role: AuthRole.qa);

      expect(find.text('Akses ditolak'), findsOneWidget);
      expect(find.text('2 aktivitas'), findsNothing);
    });
  });
}
