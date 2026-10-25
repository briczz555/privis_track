import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';
import '../dto/dashboard_dto.dart';
import '../models/dashboard_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._remote);

  final IDashboardRemoteDataSource _remote;

  @override
  Future<DashboardEntity> getDashboard() async {
    try {
      final payload = await _remote.fetchDashboard();
      final dto = DashboardDto.fromJson(payload);
      return DashboardModel.fromDto(dto).toEntity();
    } on DioException catch (error) {
      // Fase 1 belum memakai HTTP, tapi jalur error sudah disiapkan supaya
      // Fase 2 tinggal mengganti isi data source tanpa menyentuh layer ini.
      throw mapDioException(error);
    }
  }
}
