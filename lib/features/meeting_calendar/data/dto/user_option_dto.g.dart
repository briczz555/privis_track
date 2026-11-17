// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserOptionDto _$UserOptionDtoFromJson(Map<String, dynamic> json) =>
    _UserOptionDto(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      division: json['division'] as String?,
    );

Map<String, dynamic> _$UserOptionDtoToJson(_UserOptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'division': instance.division,
    };
