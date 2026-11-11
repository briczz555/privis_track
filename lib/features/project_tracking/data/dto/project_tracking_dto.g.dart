// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tracking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectTrackingDto _$ProjectTrackingDtoFromJson(Map<String, dynamic> json) =>
    _ProjectTrackingDto(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      client: ClientInfoDto.fromJson(json['client'] as Map<String, dynamic>),
      status: json['status'] as String,
      currentStage: (json['current_stage'] as num).toInt(),
      currentStageTitle: json['current_stage_title'] as String,
      completedStages: (json['completed_stages'] as num).toInt(),
      progressPercent: (json['progress_percent'] as num).toInt(),
      stages: (json['stages'] as List<dynamic>)
          .map((e) => ProjectStageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate: json['start_date'] as String?,
      dueDate: json['due_date'] as String?,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ProjectTrackingDtoToJson(_ProjectTrackingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'client': instance.client,
      'status': instance.status,
      'current_stage': instance.currentStage,
      'current_stage_title': instance.currentStageTitle,
      'completed_stages': instance.completedStages,
      'progress_percent': instance.progressPercent,
      'stages': instance.stages,
      'start_date': instance.startDate,
      'due_date': instance.dueDate,
      'updated_at': instance.updatedAt,
    };
