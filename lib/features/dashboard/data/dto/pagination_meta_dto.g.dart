// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationMetaDto _$PaginationMetaDtoFromJson(Map<String, dynamic> json) =>
    _PaginationMetaDto(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      statusCounts:
          (json['status_counts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const <String, int>{},
    );

Map<String, dynamic> _$PaginationMetaDtoToJson(_PaginationMetaDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'status_counts': instance.statusCounts,
    };
