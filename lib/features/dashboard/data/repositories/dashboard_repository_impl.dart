import 'package:dio/dio.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/project_list_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';
import '../dto/dashboard_dto.dart';
import '../dto/project_list_dto.dart';
import '../models/dashboard_model.dart';
import '../models/project_list_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._remote);

  final IDashboardRemoteDataSource _remote;

  @override
  Future<DashboardEntity> getDashboard() async {
    try {
      final payload = await _remote.fetchDashboard();
      return DashboardModel.fromDto(DashboardDto.fromJson(payload)).toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<ProjectListEntity> getProjects({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  }) async {
    try {
      final payload = await _remote.fetchProjects(
        page: page,
        limit: limit,
        status: status,
        search: search,
      );
      return ProjectListModel.fromDto(ProjectListDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }
}
