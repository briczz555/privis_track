import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';

part 'audit_log_entity.freezed.dart';

@freezed
sealed class AuditLogEntity with _$AuditLogEntity {
  const factory AuditLogEntity({
    required String id,
    required String actorName,
    required AuthRole actorRole,
    required String action,
    required String entity,
    String? entityId,
    required String summary,
    required DateTime createdAt,
  }) = _AuditLogEntity;
}
