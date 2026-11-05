import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_info_entity.freezed.dart';

/// Informasi perusahaan klien beserta PIC yang bisa dihubungi.
@freezed
sealed class ClientInfoEntity with _$ClientInfoEntity {
  const factory ClientInfoEntity({
    required String name,
    required String address,
    required String contactName,
    required String contactRole,
    required String phone,
  }) = _ClientInfoEntity;
}
