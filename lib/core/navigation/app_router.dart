import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';

part 'app_router.g.dart';

/// Instance GoRouter tunggal untuk seluruh aplikasi.
/// File ini hanya mengonsumsi `appRoutes` dari routes.dart — JANGAN
/// mendefinisikan GoRoute individual langsung di sini.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: !const bool.fromEnvironment('dart.vm.product'),
    routes: appRoutes,
    // TODO: tambahkan `redirect` di sini kalau perlu auth guard. Pakai `ref.read(...)`
    // di dalam closure ini, JANGAN `ref.watch(...)` — ref.watch membuat ulang GoRouter
    // tiap state berubah dan me-reset stack navigasi. Untuk trigger ulang redirect saat
    // state auth berubah, pakai `ref.listen(...)` yang men-trigger `refreshListenable`.
    // Selama status masih loading, `redirect` harus `return null` (diam di tempat),
    // jangan lempar ke splash — supaya URL di web tidak hilang saat refresh.
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Halaman tidak ditemukan: ${state.uri}')),
    ),
  );
}
