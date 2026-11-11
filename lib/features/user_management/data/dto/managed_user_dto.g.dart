// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagedUserDto _$ManagedUserDtoFromJson(Map<String, dynamic> json) =>
    _ManagedUserDto(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      division: json['division'] as String?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ManagedUserDtoToJson(_ManagedUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'division': instance.division,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
    };
