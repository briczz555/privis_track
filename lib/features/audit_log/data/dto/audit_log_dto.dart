import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_dto.freezed.dart';
part 'audit_log_dto.g.dart';

@freezed
sealed class AuditLogDto with _$AuditLogDto {
  const factory AuditLogDto({
    required String id,
    @JsonKey(name: 'actor_name') required String actorName,
    @JsonKey(name: 'actor_role') required String actorRole,
    required String action,
    required String entity,
    @JsonKey(name: 'entity_id') String? entityId,
    required String summary,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _AuditLogDto;

  factory AuditLogDto.fromJson(Map<String, dynamic> json) =>
      _$AuditLogDtoFromJson(json);
}
