import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class RestoreSessionUsecase {
  const RestoreSessionUsecase(this._repository);

  final AuthRepository _repository;

  Future<AuthSessionEntity?> call() => _repository.restoreSession();
}
