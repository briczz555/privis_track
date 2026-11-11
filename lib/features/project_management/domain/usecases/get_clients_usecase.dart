import '../entities/client_option_entity.dart';
import '../repositories/project_management_repository.dart';

class GetClientsUsecase {
  const GetClientsUsecase(this._repository);

  final ProjectManagementRepository _repository;

  Future<List<ClientOptionEntity>> call() => _repository.getClients();
}
