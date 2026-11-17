import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_option_dto.freezed.dart';
part 'user_option_dto.g.dart';

@freezed
sealed class UserOptionDto with _$UserOptionDto {
  const factory UserOptionDto({
    required String id,
    required String name,
    required String role,
    String? division,
  }) = _UserOptionDto;

  factory UserOptionDto.fromJson(Map<String, dynamic> json) =>
      _$UserOptionDtoFromJson(json);
}
