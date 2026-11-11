// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectSummaryDto _$ProjectSummaryDtoFromJson(Map<String, dynamic> json) =>
    _ProjectSummaryDto(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      client: ClientSummaryDto.fromJson(json['client'] as Map<String, dynamic>),
      status: json['status'] as String,
      currentStage: (json['current_stage'] as num).toInt(),
      currentStageTitle: json['current_stage_title'] as String,
      completedStages: (json['completed_stages'] as num).toInt(),
      progressPercent: (json['progress_percent'] as num).toInt(),
      documentCount: (json['document_count'] as num).toInt(),
      dueDate: json['due_date'] as String?,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ProjectSummaryDtoToJson(_ProjectSummaryDto instance) =>
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
      'document_count': instance.documentCount,
      'due_date': instance.dueDate,
      'updated_at': instance.updatedAt,
    };
