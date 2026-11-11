import '../repositories/user_management_repository.dart';

class ResetUserPasswordUsecase {
  const ResetUserPasswordUsecase(this._repository);

  final UserManagementRepository _repository;

  Future<void> call({required String id, required String newPassword}) =>
      _repository.resetPassword(id: id, newPassword: newPassword);
}
