import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/navigation/app_router.dart';

void main() {
  group('resolveAuthRedirect', () {
    test('menyimpan halaman tujuan saat belum login', () {
      final result = resolveAuthRedirect(
        isLoading: false,
        loggedIn: false,
        onboardingSeen: true,
        path: '/projects/PRJ-001',
        uri: Uri.parse('/projects/PRJ-001'),
      );

      expect(result, '/login?from=%2Fprojects%2FPRJ-001');
    });

    test('kembali ke halaman tujuan setelah login', () {
      final result = resolveAuthRedirect(
        isLoading: false,
        loggedIn: true,
        onboardingSeen: true,
        path: '/login',
        uri: Uri.parse('/login?from=%2Fprojects%2FPRJ-001'),
      );

      expect(result, '/projects/PRJ-001');
    });

    test('login biasa kembali ke dashboard', () {
      final result = resolveAuthRedirect(
        isLoading: false,
        loggedIn: true,
        onboardingSeen: true,
        path: '/login',
        uri: Uri.parse('/login'),
      );

      expect(result, '/');
    });

    test('menolak tujuan eksternal atau halaman auth', () {
      expect(
        resolveAuthRedirect(
          isLoading: false,
          loggedIn: true,
          onboardingSeen: true,
          path: '/login',
          uri: Uri.parse('/login?from=%2F%2Fevil.example'),
        ),
        '/',
      );
      expect(
        resolveAuthRedirect(
          isLoading: false,
          loggedIn: true,
          onboardingSeen: true,
          path: '/login',
          uri: Uri.parse('/login?from=%2Flogin'),
        ),
        '/',
      );
    });

    test('tidak redirect saat sesi masih dipulihkan', () {
      expect(
        resolveAuthRedirect(
          isLoading: true,
          loggedIn: false,
          onboardingSeen: true,
          path: '/projects/PRJ-001',
          uri: Uri.parse('/projects/PRJ-001'),
        ),
        isNull,
      );
    });

    group('onboarding', () {
      test('user baru selalu diarahkan ke onboarding', () {
        expect(
          resolveAuthRedirect(
            isLoading: true,
            loggedIn: false,
            onboardingSeen: false,
            path: '/splash',
            uri: Uri.parse('/splash'),
          ),
          '/onboarding',
        );
        expect(
          resolveAuthRedirect(
            isLoading: false,
            loggedIn: true,
            onboardingSeen: false,
            path: '/',
            uri: Uri.parse('/'),
          ),
          '/onboarding',
        );
      });

      test('tidak redirect saat sudah di halaman onboarding', () {
        expect(
          resolveAuthRedirect(
            isLoading: false,
            loggedIn: false,
            onboardingSeen: false,
            path: '/onboarding',
            uri: Uri.parse('/onboarding'),
          ),
          isNull,
        );
      });

      test('setelah onboarding selesai diarahkan ke login atau dashboard', () {
        expect(
          resolveAuthRedirect(
            isLoading: false,
            loggedIn: false,
            onboardingSeen: true,
            path: '/onboarding',
            uri: Uri.parse('/onboarding'),
          ),
          '/login',
        );
        expect(
          resolveAuthRedirect(
            isLoading: false,
            loggedIn: true,
            onboardingSeen: true,
            path: '/onboarding',
            uri: Uri.parse('/onboarding'),
          ),
          '/',
        );
      });
    });
  });
}
