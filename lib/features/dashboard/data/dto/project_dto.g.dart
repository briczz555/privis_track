// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => _ProjectDto(
  id: json['id'] as String,
  name: json['name'] as String,
  client: json['client'] as String,
  status: json['status'] as String,
  currentStage: (json['current_stage'] as num).toInt(),
  currentStageTitle: json['current_stage_title'] as String,
  documentCount: (json['document_count'] as num?)?.toInt() ?? 0,
  dueDate: json['due_date'] as String?,
);

Map<String, dynamic> _$ProjectDtoToJson(_ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'client': instance.client,
      'status': instance.status,
      'current_stage': instance.currentStage,
      'current_stage_title': instance.currentStageTitle,
      'document_count': instance.documentCount,
      'due_date': instance.dueDate,
    };
