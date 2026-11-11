import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class ChangePasswordUsecase {
  const ChangePasswordUsecase(this._repository);

  final AuthRepository _repository;

  Future<AuthSessionEntity> call({
    required String currentPassword,
    required String newPassword,
  }) => _repository.changePassword(
    currentPassword: currentPassword,
    newPassword: newPassword,
  );
}
