import 'package:dio/dio.dart';
// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

part 'dio_provider.g.dart';

/// Instance Dio tunggal untuk seluruh aplikasi.
/// JANGAN buat `Dio()` baru di dalam fitur — selalu ambil lewat provider ini.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(apiBaseOptions());

  dio.interceptors.addAll([
    AuthInterceptor(ref, dio),
    // Logging interceptor aktif hanya di mode non-release.
    if (!const bool.fromEnvironment('dart.vm.product')) LoggingInterceptor(),
  ]);

  ref.onDispose(dio.close);

  return dio;
}
