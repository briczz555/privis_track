import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../../domain/repositories/project_tracking_repository.dart';
import '../datasources/project_tracking_remote_data_source.dart';
import '../dto/project_tracking_dto.dart';
import '../models/project_tracking_model.dart';

class ProjectTrackingRepositoryImpl implements ProjectTrackingRepository {
  ProjectTrackingRepositoryImpl(this._remote);

  final IProjectTrackingRemoteDataSource _remote;

  @override
  Future<ProjectTrackingEntity> getProject(String projectCode) async {
    try {
      final payload = await _remote.fetchProject(projectCode);
      return ProjectTrackingModel.fromDto(ProjectTrackingDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }
}
