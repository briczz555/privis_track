// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityDto _$ActivityDtoFromJson(Map<String, dynamic> json) => _ActivityDto(
  id: json['id'] as String,
  type: json['type'] as String,
  actor: ActivityActorDto.fromJson(json['actor'] as Map<String, dynamic>),
  action: json['action'] as String,
  target: json['target'] as String,
  project: ActivityProjectDto.fromJson(json['project'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$ActivityDtoToJson(_ActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actor': instance.actor,
      'action': instance.action,
      'target': instance.target,
      'project': instance.project,
      'created_at': instance.createdAt,
    };
