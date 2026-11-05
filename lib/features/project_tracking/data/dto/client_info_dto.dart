import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_info_dto.freezed.dart';
part 'client_info_dto.g.dart';

/// Bentuk mentah data perusahaan klien sesuai payload API.
@freezed
sealed class ClientInfoDto with _$ClientInfoDto {
  const factory ClientInfoDto({
    required String name,
    required String address,
    @JsonKey(name: 'contact_name') required String contactName,
    @JsonKey(name: 'contact_role') required String contactRole,
    required String phone,
  }) = _ClientInfoDto;

  factory ClientInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ClientInfoDtoFromJson(json);
}
