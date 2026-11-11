import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../../../core/storage/cache_store.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/project_list_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';
import '../dto/dashboard_dto.dart';
import '../dto/project_list_dto.dart';
import '../models/dashboard_model.dart';
import '../models/project_list_model.dart';

const _dashboardCacheKey = 'dashboard';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._remote, this._cache);

  final IDashboardRemoteDataSource _remote;
  final SnapshotCache _cache;

  @override
  Future<DashboardEntity> getDashboard() async {
    try {
      final payload = await _remote.fetchDashboard();
      final entity = DashboardModel.fromDto(DashboardDto.fromJson(payload))
          .toEntity();
      await _writeCache(_dashboardCacheKey, payload);
      return entity;
    } on DioException catch (error) {
      final mapped = mapDioException(error);
      if (isOfflineError(mapped)) {
        final cached = await _readCache(_dashboardCacheKey);
        if (cached != null) {
          return DashboardModel.fromDto(
            DashboardDto.fromJson(decodeCachedPayload(cached.payload)),
          ).toEntity().copyWith(isFromCache: true, cachedAt: cached.updatedAt);
        }
      }
      throw mapped;
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
    final cacheKey =
        'projects:page=$page:limit=$limit:'
        'status=${status?.name ?? 'all'}:search=${search ?? ''}';

    try {
      final payload = await _remote.fetchProjects(
        page: page,
        limit: limit,
        status: status,
        search: search,
      );
      final entity = ProjectListModel.fromDto(ProjectListDto.fromJson(payload))
          .toEntity();
      await _writeCache(cacheKey, payload);
      return entity;
    } on DioException catch (error) {
      final mapped = mapDioException(error);
      if (isOfflineError(mapped)) {
        final cached = await _readCache(cacheKey);
        if (cached != null) {
          return ProjectListModel.fromDto(
            ProjectListDto.fromJson(decodeCachedPayload(cached.payload)),
          ).toEntity().copyWith(isFromCache: true, cachedAt: cached.updatedAt);
        }
      }
      throw mapped;
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  Future<void> _writeCache(String key, Map<String, dynamic> payload) async {
    try {
      await _cache.write(key: key, payload: jsonEncode(payload));
    } catch (_) {
      // Cache bersifat best-effort; kegagalan menyimpan tidak boleh
      // menggagalkan request online.
    }
  }

  Future<CachedSnapshot?> _readCache(String key) async {
    try {
      return await _cache.read(key);
    } catch (_) {
      return null;
    }
  }
}
