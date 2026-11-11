import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/auth_session_cache.dart';

const authRetryExtraKey = 'authRetry';

/// Menambahkan Bearer token ke setiap request dan mencoba refresh sekali
/// ketika menerima 401.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._ref, this._dio);

  final Ref _ref;
  final Dio _dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _ref.read(authSessionCacheProvider).accessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final cache = _ref.read(authSessionCacheProvider);
    final isAuthRetry = err.requestOptions.extra[authRetryExtraKey] == true;
    final isUnauthorized = err.response?.statusCode == 401;

    if (!isUnauthorized || isAuthRetry || !cache.hasSession) {
      handler.next(err);
      return;
    }

    final newAccessToken = await cache.refreshAccessToken();
    if (newAccessToken == null) {
      handler.next(err);
      return;
    }

    final options = err.requestOptions;
    options.extra = {...options.extra, authRetryExtraKey: true};
    options.headers['Authorization'] = 'Bearer $newAccessToken';

    try {
      final response = await _dio.fetch<dynamic>(options);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }
}
