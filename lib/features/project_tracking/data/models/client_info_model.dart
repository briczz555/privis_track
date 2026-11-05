import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/client_info_entity.dart';
import '../dto/client_info_dto.dart';

part 'client_info_model.freezed.dart';

@freezed
sealed class ClientInfoModel with _$ClientInfoModel {
  const ClientInfoModel._();

  const factory ClientInfoModel({
    required String name,
    required String address,
    required String contactName,
    required String contactRole,
    required String phone,
  }) = _ClientInfoModel;

  factory ClientInfoModel.fromDto(ClientInfoDto dto) => ClientInfoModel(
    name: dto.name,
    address: dto.address,
    contactName: dto.contactName,
    contactRole: dto.contactRole,
    phone: dto.phone,
  );

  ClientInfoEntity toEntity() => ClientInfoEntity(
    name: name,
    address: address,
    contactName: contactName,
    contactRole: contactRole,
    phone: phone,
  );
}
