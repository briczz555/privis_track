// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/dashboard_remote_data_source.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';

part 'dashboard_provider.g.dart';

@riverpod
GetDashboardUsecase getDashboardUsecase(Ref ref) {
  return GetDashboardUsecase(
    DashboardRepositoryImpl(const DashboardRemoteDataSource()),
  );
}

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardEntity> build() {
    return ref.watch(getDashboardUsecaseProvider).call();
  }

  Future<void> refresh() async {
    // Biarkan data lama tetap tampil selama request berjalan (RefreshIndicator
    // sudah punya spinner sendiri), lalu ganti state dengan hasil terbaru.
    final usecase = ref.read(getDashboardUsecaseProvider);
    final result = await AsyncValue.guard<DashboardEntity>(usecase.call);
    if (!ref.mounted) return;
    state = result;
  }
}
