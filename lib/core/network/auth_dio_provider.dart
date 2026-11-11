import 'package:dio/dio.dart';
// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_config.dart';
import 'interceptors/logging_interceptor.dart';

part 'auth_dio_provider.g.dart';

/// Dio khusus auth (login/refresh/logout) tanpa AuthInterceptor, supaya proses
/// refresh tidak memicu loop 401.
@Riverpod(keepAlive: true)
Dio authDio(Ref ref) {
  final dio = Dio(apiBaseOptions());

  if (!const bool.fromEnvironment('dart.vm.product')) {
    dio.interceptors.add(LoggingInterceptor());
  }

  ref.onDispose(dio.close);

  return dio;
}
