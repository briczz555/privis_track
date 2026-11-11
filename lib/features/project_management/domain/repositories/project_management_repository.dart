import '../entities/client_form_entity.dart';
import '../entities/client_option_entity.dart';

abstract interface class ProjectManagementRepository {
  Future<List<ClientOptionEntity>> getClients();

  Future<String> createProject({
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    String? clientId,
    ClientFormEntity? newClient,
  });

  Future<void> updateProject({
    required String code,
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    required ClientFormEntity client,
  });
}
