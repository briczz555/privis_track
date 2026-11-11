// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectListDto _$ProjectListDtoFromJson(Map<String, dynamic> json) =>
    _ProjectListDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PaginationMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectListDtoToJson(_ProjectListDto instance) =>
    <String, dynamic>{'data': instance.data, 'meta': instance.meta};
