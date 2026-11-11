// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/dashboard_remote_data_source.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/project_list_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../../domain/usecases/get_projects_usecase.dart';

part 'dashboard_provider.g.dart';

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepositoryImpl(
    DashboardRemoteDataSource(ref.watch(dioProvider)),
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
  Future<DashboardEntity> build() {
    return ref.watch(getDashboardUsecaseProvider).call();
  }

  Future<void> refresh() async {
    // Biarkan data lama tetap tampil selama request berjalan.
    final usecase = ref.read(getDashboardUsecaseProvider);
    final result = await AsyncValue.guard<DashboardEntity>(usecase.call);
    if (!ref.mounted) return;
    state = result;
  }
}

@riverpod
class AllProjectsNotifier extends _$AllProjectsNotifier {
  @override
  Future<ProjectListEntity> build() {
    return ref.watch(getProjectsUsecaseProvider).call();
  }

  Future<void> refresh() async {
    final usecase = ref.read(getProjectsUsecaseProvider);
    final result = await AsyncValue.guard<ProjectListEntity>(usecase.call);
    if (!ref.mounted) return;
    state = result;
  }
}
