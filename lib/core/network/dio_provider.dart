import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'interceptors/logging_interceptor.dart';

part 'dio_provider.g.dart';

/// Base URL API. Ganti default value ini (biasanya diisi otomatis oleh skill
/// `flutter-clean-starter:start` dari jawabanmu), atau override lewat
/// `--dart-define=API_BASE_URL=https://...` saat build/run.
const _apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://api.example.com',
);

/// Instance Dio tunggal untuk seluruh aplikasi.
/// JANGAN buat `Dio()` baru di dalam fitur — selalu ambil lewat provider ini.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: _apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: const {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.addAll([
    // Logging interceptor aktif hanya di mode non-release.
    if (!const bool.fromEnvironment('dart.vm.product')) LoggingInterceptor(),
  ]);

  return dio;
}
