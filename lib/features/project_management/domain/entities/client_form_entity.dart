import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_form_entity.freezed.dart';

/// Data kontak klien yang dikirim saat membuat/mengubah proyek.
///
/// Klien bersifat shared: perubahan di sini berlaku untuk semua proyek
/// milik klien yang sama.
@freezed
sealed class ClientFormEntity with _$ClientFormEntity {
  const factory ClientFormEntity({
    required String name,
    required String address,
    required String contactName,
    required String contactRole,
    required String phone,
  }) = _ClientFormEntity;
}
