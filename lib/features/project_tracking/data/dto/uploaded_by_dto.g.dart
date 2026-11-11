// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_by_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadedByDto _$UploadedByDtoFromJson(Map<String, dynamic> json) =>
    _UploadedByDto(
      id: json['id'] as String,
      name: json['name'] as String,
      division: json['division'] as String?,
    );

Map<String, dynamic> _$UploadedByDtoToJson(_UploadedByDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'division': instance.division,
    };
