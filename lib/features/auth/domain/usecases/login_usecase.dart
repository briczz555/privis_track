import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  const LoginUsecase(this._repository);

  final AuthRepository _repository;

  Future<AuthSessionEntity> call({
    required String email,
    required String password,
  }) => _repository.login(email: email, password: password);
}
