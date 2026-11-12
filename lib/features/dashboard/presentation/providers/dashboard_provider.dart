import 'dart:async';

// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/storage/cache_store.dart';
import '../../data/datasources/dashboard_remote_data_source.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/project_list_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../../domain/usecases/get_projects_usecase.dart';
import '../../../project_tracking/presentation/providers/project_tracking_provider.dart';

part 'dashboard_provider.g.dart';

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepositoryImpl(
    DashboardRemoteDataSource(ref.watch(dioProvider)),
    ref.watch(cacheStoreProvider),
  );
}

@riverpod
GetDashboardUsecase getDashboardUsecase(Ref ref) {
  return GetDashboardUsecase(ref.watch(dashboardRepositoryProvider));
}

@riverpod
GetProjectsUsecase getProjectsUsecase(Ref ref) {
  return GetProjectsUsecase(ref.watch(dashboardRepositoryProvider));
}

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardEntity> build() async {
    final dashboard = await ref.watch(getDashboardUsecaseProvider).call();
    // Siapkan cache offline: daftar proyek + detail tiap proyek. Dilewati
    // saat data dashboard sendiri berasal dari cache (sedang offline).
    if (!dashboard.isFromCache) unawaited(_warmOfflineCache());
    return dashboard;
  }

  Future<void> refresh() async {
    // Biarkan data lama tetap tampil selama request berjalan.
    final usecase = ref.read(getDashboardUsecaseProvider);
    final result = await AsyncValue.guard<DashboardEntity>(usecase.call);
    if (!ref.mounted) return;
    state = result;

    final updated = result.value;
    if (updated != null && !updated.isFromCache) {
      unawaited(_warmOfflineCache());
    }
  }

  Future<void> _warmOfflineCache() async {
    try {
      final list = await ref.read(getProjectsUsecaseProvider).call();
      if (list.isFromCache) return;

      await ref
          .read(prefetchProjectDetailsUsecaseProvider)
          .call(
            projectCodes: list.projects
                .map((project) => project.code)
                .toList(growable: false),
          );
    } catch (_) {
      // Pemanasan cache bersifat best-effort; kegagalan tidak ditampilkan.
    }
  }
}

@riverpod
class AllProjectsNotifier extends _$AllProjectsNotifier {
  bool _loadingMore = false;
  String? _statusApi;

  ProjectStatus? get _status =>
      _statusApi == null ? null : projectStatusFromApi(_statusApi!);

  @override
  Future<ProjectListEntity> build(String? statusApi) {
    _statusApi = statusApi;
    return ref.watch(getProjectsUsecaseProvider).call(status: _status);
  }

  Future<void> refresh() async {
    final usecase = ref.read(getProjectsUsecaseProvider);
    final result = await AsyncValue.guard<ProjectListEntity>(
      () => usecase.call(status: _status),
    );
    if (!ref.mounted) return;
    state = result;
  }

  Future<void> loadMore() async {
    if (_loadingMore) return;

    final current = state.value;
    if (current == null ||
        current.isLoadingMore ||
        current.page >= current.totalPages) {
      return;
    }

    _loadingMore = true;
    state = AsyncData(current.copyWith(isLoadingMore: true));

    try {
      final next = await ref
          .read(getProjectsUsecaseProvider)
          .call(page: current.page + 1, limit: current.limit, status: _status);

      if (!ref.mounted) return;

      final latest = state.value ?? current;
      state = AsyncData(
        latest.copyWith(
          projects: [...latest.projects, ...next.projects],
          page: next.page,
          limit: next.limit,
          total: next.total,
          totalPages: next.totalPages,
          statusCounts: next.statusCounts.isNotEmpty
              ? next.statusCounts
              : latest.statusCounts,
          isFromCache: latest.isFromCache || next.isFromCache,
          cachedAt: next.cachedAt ?? latest.cachedAt,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      if (!ref.mounted) return;
      final latest = state.value;
      if (latest != null) {
        state = AsyncData(latest.copyWith(isLoadingMore: false));
      }
      rethrow;
    } finally {
      _loadingMore = false;
    }
  }
}
