// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_stage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectStageDto _$ProjectStageDtoFromJson(Map<String, dynamic> json) =>
    _ProjectStageDto(
      stageNo: (json['stage_no'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: json['is_completed'] as bool,
      completedAt: json['completed_at'] as String?,
      documents:
          (json['documents'] as List<dynamic>?)
              ?.map((e) => StageDocumentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StageDocumentDto>[],
    );

Map<String, dynamic> _$ProjectStageDtoToJson(_ProjectStageDto instance) =>
    <String, dynamic>{
      'stage_no': instance.stageNo,
      'title': instance.title,
      'is_completed': instance.isCompleted,
      'completed_at': instance.completedAt,
      'documents': instance.documents,
    };
