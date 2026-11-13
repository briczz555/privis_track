// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/audit_log_remote_data_source.dart';
import '../../data/repositories/audit_log_repository_impl.dart';
import '../../domain/entities/audit_log_page_entity.dart';
import '../../domain/repositories/audit_log_repository.dart';
import '../../domain/usecases/get_audit_logs_usecase.dart';

part 'audit_log_provider.g.dart';

@riverpod
AuditLogRepository auditLogRepository(Ref ref) {
  return AuditLogRepositoryImpl(
    AuditLogRemoteDataSource(ref.watch(dioProvider)),
  );
}

@riverpod
GetAuditLogsUsecase getAuditLogsUsecase(Ref ref) {
  return GetAuditLogsUsecase(ref.watch(auditLogRepositoryProvider));
}

@riverpod
class AuditLogNotifier extends _$AuditLogNotifier {
  static const _pageSize = 30;
  bool _loadingMore = false;

  @override
  Future<AuditLogPageEntity> build() {
    return ref.watch(getAuditLogsUsecaseProvider).call(limit: _pageSize);
  }

  Future<void> refresh() async {
    final result = await AsyncValue.guard<AuditLogPageEntity>(
      () => ref.read(getAuditLogsUsecaseProvider).call(limit: _pageSize),
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
          .read(getAuditLogsUsecaseProvider)
          .call(page: current.page + 1, limit: current.limit);

      if (!ref.mounted) return;

      final latest = state.value ?? current;
      state = AsyncData(
        latest.copyWith(
          logs: [...latest.logs, ...next.logs],
          page: next.page,
          limit: next.limit,
          total: next.total,
          totalPages: next.totalPages,
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
