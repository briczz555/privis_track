import '../entities/auth_session_entity.dart';

abstract interface class AuthRepository {
  Future<AuthSessionEntity> login({
    required String email,
    required String password,
  });

  Future<AuthSessionEntity> refresh(String refreshToken);

  Future<AuthSessionEntity?> restoreSession();

  Future<void> logout();
}
