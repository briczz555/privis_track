import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_option_entity.freezed.dart';

/// Klien yang sudah ada, dipakai untuk dropdown saat membuat proyek.
@freezed
sealed class ClientOptionEntity with _$ClientOptionEntity {
  const factory ClientOptionEntity({required String id, required String name}) =
      _ClientOptionEntity;
}
