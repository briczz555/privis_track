import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_dto.freezed.dart';
part 'auth_user_dto.g.dart';

@freezed
sealed class AuthUserDto with _$AuthUserDto {
  const factory AuthUserDto({
    required String id,
    required String name,
    required String email,
    required String role,
    String? division,
  }) = _AuthUserDto;

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);
}
