import 'package:dio/dio.dart';

/// Exception yang aman dipakai di layer domain/presentation (tanpa tipe Dio).
sealed class NetworkException implements Exception {
  const NetworkException(this.message);

  final String message;

  @override
  String toString() => message;
}

class NoConnectionException extends NetworkException {
  const NoConnectionException([super.message = 'Tidak ada koneksi internet.']);
}

class TimeoutNetworkException extends NetworkException {
  const TimeoutNetworkException([
    super.message = 'Permintaan ke server melebihi batas waktu.',
  ]);
}

class UnauthorizedException extends NetworkException {
  const UnauthorizedException([
    super.message = 'Sesi berakhir, silakan login kembali.',
  ]);
}

class ForbiddenException extends NetworkException {
  const ForbiddenException([
    super.message = 'Anda tidak punya akses untuk aksi ini.',
  ]);
}

class NotFoundException extends NetworkException {
  const NotFoundException([super.message = 'Data tidak ditemukan.']);
}

class ConflictException extends NetworkException {
  const ConflictException([super.message = 'Terjadi konflik data.']);
}

class ValidationException extends NetworkException {
  const ValidationException([super.message = 'Data yang dikirim tidak valid.']);

  const ValidationException.withMessage(super.message);
}

class RateLimitedException extends NetworkException {
  const RateLimitedException([
    super.message = 'Terlalu banyak permintaan, coba lagi nanti.',
  ]);
}

class ServerException extends NetworkException {
  const ServerException(this.statusCode, super.message);

  final int? statusCode;
}

class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException(super.message);
}

/// True bila kegagalan disebabkan koneksi/timeout, bukan auth, izin, atau
/// validasi. Hanya jenis ini yang boleh memakai cache offline.
bool isOfflineError(Object? error) =>
    error is NoConnectionException || error is TimeoutNetworkException;

NetworkException mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return const NoConnectionException();
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return const TimeoutNetworkException();
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final apiMessage = _apiErrorMessage(e.response?.data);

      switch (statusCode) {
        case 401:
          return UnauthorizedException(
            apiMessage ?? 'Sesi berakhir, silakan login kembali.',
          );
        case 403:
          return ForbiddenException(
            apiMessage ?? 'Anda tidak punya akses untuk aksi ini.',
          );
        case 404:
          return NotFoundException(apiMessage ?? 'Data tidak ditemukan.');
        case 409:
          return ConflictException(apiMessage ?? 'Terjadi konflik data.');
        case 400:
        case 413:
        case 415:
        case 422:
          return ValidationException(
            apiMessage ?? 'Data yang dikirim tidak valid.',
          );
        case 429:
          return RateLimitedException(
            apiMessage ?? 'Terlalu banyak permintaan, coba lagi nanti.',
          );
        default:
          return ServerException(
            statusCode,
            apiMessage ?? 'Terjadi kesalahan pada server.',
          );
      }
    default:
      return UnknownNetworkException(
        e.message ?? 'Terjadi kesalahan tak terduga.',
      );
  }
}

String? _apiErrorMessage(dynamic data) {
  if (data is Map && data['error'] is Map) {
    final error = data['error'] as Map;
    final message = error['message'];
    if (message is String && message.trim().isNotEmpty) return message;
  }
  return null;
}
