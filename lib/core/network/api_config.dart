import 'package:dio/dio.dart';

/// Base URL API. Default production; override saat build/run:
/// `--dart-define=API_BASE_URL=http://10.0.2.2:3000/v1` (Android emulator).
const apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://privis.briczz.my.id/v1',
);

BaseOptions apiBaseOptions() {
  final normalizedBaseUrl = apiBaseUrl.endsWith('/')
      ? apiBaseUrl
      : '$apiBaseUrl/';

  return BaseOptions(
    baseUrl: normalizedBaseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
    headers: const {'Content-Type': 'application/json'},
  );
}
