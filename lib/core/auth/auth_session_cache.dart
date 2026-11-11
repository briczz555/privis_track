// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_session_cache.g.dart';

/// Cache token di memori supaya `AuthInterceptor` bisa membaca access token
/// secara sinkron tanpa menunggu secure storage.
class AuthSessionCache {
  String? accessToken;
  String? refreshToken;
  DateTime? expiresAt;

  Future<String?> Function()? _refreshHandler;

  bool get hasSession => refreshToken != null;

  void update({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
    required Future<String?> Function() refresh,
  }) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    this.expiresAt = expiresAt;
    _refreshHandler = refresh;
  }

  Future<String?> refreshAccessToken() async {
    final handler = _refreshHandler;
    if (handler == null) return null;
    return handler();
  }

  void clear() {
    accessToken = null;
    refreshToken = null;
    expiresAt = null;
    _refreshHandler = null;
  }
}

@Riverpod(keepAlive: true)
AuthSessionCache authSessionCache(Ref ref) => AuthSessionCache();
