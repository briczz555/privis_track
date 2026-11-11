import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_option_dto.freezed.dart';
part 'client_option_dto.g.dart';

@freezed
sealed class ClientOptionDto with _$ClientOptionDto {
  const factory ClientOptionDto({required String id, required String name}) =
      _ClientOptionDto;

  factory ClientOptionDto.fromJson(Map<String, dynamic> json) =>
      _$ClientOptionDtoFromJson(json);
}
