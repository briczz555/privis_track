// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) =>
    _DashboardDto(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardDtoToJson(_DashboardDto instance) =>
    <String, dynamic>{
      'projects': instance.projects,
      'activities': instance.activities,
    };
