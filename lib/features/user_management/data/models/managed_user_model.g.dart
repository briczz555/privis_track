// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagedUserModel _$ManagedUserModelFromJson(Map<String, dynamic> json) =>
    _ManagedUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      division: json['division'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ManagedUserModelToJson(_ManagedUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'division': instance.division,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };
