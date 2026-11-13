// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLogDto _$AuditLogDtoFromJson(Map<String, dynamic> json) => _AuditLogDto(
  id: json['id'] as String,
  actorName: json['actor_name'] as String,
  actorRole: json['actor_role'] as String,
  action: json['action'] as String,
  entity: json['entity'] as String,
  entityId: json['entity_id'] as String?,
  summary: json['summary'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AuditLogDtoToJson(_AuditLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actor_name': instance.actorName,
      'actor_role': instance.actorRole,
      'action': instance.action,
      'entity': instance.entity,
      'entity_id': instance.entityId,
      'summary': instance.summary,
      'created_at': instance.createdAt.toIso8601String(),
    };
