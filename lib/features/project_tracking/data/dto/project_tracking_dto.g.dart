// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tracking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectTrackingDto _$ProjectTrackingDtoFromJson(Map<String, dynamic> json) =>
    _ProjectTrackingDto(
      id: json['id'] as String,
      name: json['name'] as String,
      client: json['client'] as String,
      status: json['status'] as String,
      currentStage: (json['current_stage'] as num).toInt(),
      stages: (json['stages'] as List<dynamic>)
          .map((e) => ProjectStageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTrackingDtoToJson(_ProjectTrackingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'client': instance.client,
      'status': instance.status,
      'current_stage': instance.currentStage,
      'stages': instance.stages,
    };
