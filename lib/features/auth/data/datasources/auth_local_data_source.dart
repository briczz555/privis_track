import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class IAuthLocalDataSource {
  Future<String?> readSession();

  Future<void> writeSession(String json);

  Future<void> clearSession();
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  AuthLocalDataSource({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  static const _sessionKey = 'privis_auth_session';

  final FlutterSecureStorage _storage;

  @override
  Future<String?> readSession() => _storage.read(key: _sessionKey);

  @override
  Future<void> writeSession(String json) =>
      _storage.write(key: _sessionKey, value: json);

  @override
  Future<void> clearSession() => _storage.delete(key: _sessionKey);
}
