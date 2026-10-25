import 'package:dio/dio.dart';

sealed class NetworkException implements Exception {
  const NetworkException(this.message);
  final String message;
}

class NoConnectionException extends NetworkException {
  const NoConnectionException() : super('Tidak ada koneksi internet.');
}

class TimeoutNetworkException extends NetworkException {
  const TimeoutNetworkException()
    : super('Permintaan ke server melebihi batas waktu.');
}

class ServerException extends NetworkException {
  const ServerException(this.statusCode, super.message);
  final int? statusCode;
}

class UnauthorizedException extends NetworkException {
  const UnauthorizedException()
    : super('Sesi berakhir, silakan login kembali.');
}

class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException(super.message);
}

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
      if (statusCode == 401) return const UnauthorizedException();
      return ServerException(statusCode, e.message ?? 'Server error');
    default:
      return UnknownNetworkException(e.message ?? 'Unknown network error');
  }
}
