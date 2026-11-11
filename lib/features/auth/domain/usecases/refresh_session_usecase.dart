import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class RefreshSessionUsecase {
  const RefreshSessionUsecase(this._repository);

  final AuthRepository _repository;

  Future<AuthSessionEntity> call(String refreshToken) =>
      _repository.refresh(refreshToken);
}
