// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) =>
    _DashboardDto(
      generatedAt: json['generated_at'] as String,
      totalProjects: (json['total_projects'] as num).toInt(),
      portfolio: (json['portfolio'] as List<dynamic>)
          .map((e) => PortfolioSliceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeProjects: (json['active_projects'] as List<dynamic>)
          .map((e) => ProjectSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardDtoToJson(_DashboardDto instance) =>
    <String, dynamic>{
      'generated_at': instance.generatedAt,
      'total_projects': instance.totalProjects,
      'portfolio': instance.portfolio,
      'active_projects': instance.activeProjects,
      'activities': instance.activities,
    };
