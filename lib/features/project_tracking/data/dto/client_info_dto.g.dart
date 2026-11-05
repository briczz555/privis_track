// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientInfoDto _$ClientInfoDtoFromJson(Map<String, dynamic> json) =>
    _ClientInfoDto(
      name: json['name'] as String,
      address: json['address'] as String,
      contactName: json['contact_name'] as String,
      contactRole: json['contact_role'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ClientInfoDtoToJson(_ClientInfoDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'contact_name': instance.contactName,
      'contact_role': instance.contactRole,
      'phone': instance.phone,
    };
