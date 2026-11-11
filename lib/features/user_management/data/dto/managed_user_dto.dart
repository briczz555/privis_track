import 'package:freezed_annotation/freezed_annotation.dart';

part 'managed_user_dto.freezed.dart';
part 'managed_user_dto.g.dart';

@freezed
sealed class ManagedUserDto with _$ManagedUserDto {
  const factory ManagedUserDto({
    required String id,
    required String name,
    required String email,
    required String role,
    String? division,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ManagedUserDto;

  factory ManagedUserDto.fromJson(Map<String, dynamic> json) =>
      _$ManagedUserDtoFromJson(json);
}
