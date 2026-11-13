import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';
import '../../domain/entities/audit_log_entity.dart';
import '../dto/audit_log_dto.dart';

part 'audit_log_model.freezed.dart';

@freezed
sealed class AuditLogModel with _$AuditLogModel {
  const AuditLogModel._();

  const factory AuditLogModel({
    required String id,
    required String actorName,
    required String actorRole,
    required String action,
    required String entity,
    String? entityId,
    required String summary,
    required DateTime createdAt,
  }) = _AuditLogModel;

  factory AuditLogModel.fromDto(AuditLogDto dto) => AuditLogModel(
    id: dto.id,
    actorName: dto.actorName,
    actorRole: dto.actorRole,
    action: dto.action,
    entity: dto.entity,
    entityId: dto.entityId,
    summary: dto.summary,
    createdAt: dto.createdAt,
  );

  AuditLogEntity toEntity() => AuditLogEntity(
    id: id,
    actorName: actorName,
    actorRole: _roleFromApi(actorRole),
    action: action,
    entity: entity,
    entityId: entityId,
    summary: summary,
    createdAt: createdAt,
  );
}

AuthRole _roleFromApi(String value) => switch (value.toLowerCase()) {
  'admin' => AuthRole.admin,
  'pm' => AuthRole.pm,
  'developer' => AuthRole.developer,
  'qa' => AuthRole.qa,
  'finance' => AuthRole.finance,
  _ => AuthRole.unknown,
};
