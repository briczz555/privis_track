// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityDto _$ActivityDtoFromJson(Map<String, dynamic> json) => _ActivityDto(
  id: json['id'] as String,
  actor: json['actor'] as String,
  division: json['division'] as String,
  action: json['action'] as String,
  target: json['target'] as String,
  projectName: json['project_name'] as String,
  occurredAt: json['occurred_at'] as String,
);

Map<String, dynamic> _$ActivityDtoToJson(_ActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actor': instance.actor,
      'division': instance.division,
      'action': instance.action,
      'target': instance.target,
      'project_name': instance.projectName,
      'occurred_at': instance.occurredAt,
    };
