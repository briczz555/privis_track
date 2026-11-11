import '../entities/client_form_entity.dart';
import '../repositories/project_management_repository.dart';

class CreateProjectUsecase {
  const CreateProjectUsecase(this._repository);

  final ProjectManagementRepository _repository;

  Future<String> call({
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    String? clientId,
    ClientFormEntity? newClient,
  }) => _repository.createProject(
    name: name,
    startDate: startDate,
    dueDate: dueDate,
    clientId: clientId,
    newClient: newClient,
  );
}
