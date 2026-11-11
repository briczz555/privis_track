import '../entities/client_form_entity.dart';
import '../repositories/project_management_repository.dart';

class UpdateProjectDetailsUsecase {
  const UpdateProjectDetailsUsecase(this._repository);

  final ProjectManagementRepository _repository;

  Future<void> call({
    required String code,
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    required ClientFormEntity client,
  }) => _repository.updateProject(
    code: code,
    name: name,
    startDate: startDate,
    dueDate: dueDate,
    client: client,
  );
}
