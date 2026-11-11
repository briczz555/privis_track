import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/client_form_entity.dart';
import '../../domain/entities/client_option_entity.dart';
import '../../domain/repositories/project_management_repository.dart';
import '../datasources/project_management_remote_data_source.dart';
import '../dto/client_option_dto.dart';
import '../models/client_option_model.dart';

class ProjectManagementRepositoryImpl implements ProjectManagementRepository {
  ProjectManagementRepositoryImpl(this._remote);

  final IProjectManagementRemoteDataSource _remote;

  @override
  Future<List<ClientOptionEntity>> getClients() async {
    try {
      final payload = await _remote.fetchClients();
      return payload
          .map(
            (json) =>
                ClientOptionModel.fromDto(ClientOptionDto.fromJson(json))
                    .toEntity(),
          )
          .toList(growable: false);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<String> createProject({
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    String? clientId,
    ClientFormEntity? newClient,
  }) async {
    try {
      return await _remote.createProject(
        name: name,
        startDate: startDate,
        dueDate: dueDate,
        clientId: clientId,
        newClient: newClient,
      );
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<void> updateProject({
    required String code,
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    required ClientFormEntity client,
  }) async {
    try {
      await _remote.updateProject(
        code: code,
        name: name,
        startDate: startDate,
        dueDate: dueDate,
        client: client,
      );
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
