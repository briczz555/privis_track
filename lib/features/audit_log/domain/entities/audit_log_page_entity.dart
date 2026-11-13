import 'package:freezed_annotation/freezed_annotation.dart';

import 'audit_log_entity.dart';

part 'audit_log_page_entity.freezed.dart';

@freezed
sealed class AuditLogPageEntity with _$AuditLogPageEntity {
  const factory AuditLogPageEntity({
    required List<AuditLogEntity> logs,
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    @Default(false) bool isLoadingMore,
  }) = _AuditLogPageEntity;
}
