import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/providers/auth_controller.dart';
import 'routes.dart';

part 'app_router.g.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
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
      final path = state.matchedLocation;
      final isLogin = path == '/login';
      final isSplash = path == '/splash';

      // Selama sesi masih dipulihkan, tetap di halaman saat ini.
      if (auth.isLoading) return null;

      final loggedIn = auth.value != null;

      if (!loggedIn) {
        return isLogin ? null : '/login';
      }

      if (isLogin || isSplash) return '/';
      return null;
    },
    routes: appRoutes,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Halaman tidak ditemukan: ${state.uri}')),
    ),
  );
}
