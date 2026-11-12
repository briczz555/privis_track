import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/providers/auth_controller.dart';
import 'routes.dart';

part 'app_router.g.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

/// Menentukan redirect auth. Dipisah agar mudah diuji.
String? resolveAuthRedirect({
  required bool isLoading,
  required bool loggedIn,
  required String path,
  required Uri uri,
}) {
  final isLogin = path == '/login';
  final isSplash = path == '/splash';

  // Selama sesi masih dipulihkan, tetap di halaman saat ini.
  if (isLoading) return null;

  if (!loggedIn) {
    if (isLogin) return null;
    if (isSplash) return '/login';
    return '/login?from=${Uri.encodeComponent(uri.toString())}';
  }

  if (isLogin || isSplash) {
    final from = uri.queryParameters['from'];
    if (from != null &&
        from.startsWith('/') &&
        !from.startsWith('//') &&
        !from.startsWith('/login') &&
        !from.startsWith('/splash')) {
      return from;
    }
    return '/';
  }

  return null;
}

/// Instance GoRouter tunggal untuk seluruh aplikasi.
/// File ini hanya mengonsumsi `appRoutes` dari routes.dart — JANGAN
/// mendefinisikan GoRoute individual langsung di sini.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refresh = RouterRefreshNotifier();

  ref.onDispose(refresh.dispose);
  ref.listen(authControllerProvider, (previous, next) => refresh.notify());

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: !const bool.fromEnvironment('dart.vm.product'),
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);

      return resolveAuthRedirect(
        isLoading: auth.isLoading,
        loggedIn: auth.value != null,
        path: state.matchedLocation,
        uri: state.uri,
      );
    },
    routes: appRoutes,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Halaman tidak ditemukan: ${state.uri}')),
    ),
  );
}
