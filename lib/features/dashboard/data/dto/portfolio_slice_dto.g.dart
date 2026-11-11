// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_slice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioSliceDto _$PortfolioSliceDtoFromJson(Map<String, dynamic> json) =>
    _PortfolioSliceDto(
      status: json['status'] as String,
      count: (json['count'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$PortfolioSliceDtoToJson(_PortfolioSliceDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'percentage': instance.percentage,
    };
