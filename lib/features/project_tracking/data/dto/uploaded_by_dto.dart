import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploaded_by_dto.freezed.dart';
part 'uploaded_by_dto.g.dart';

@freezed
sealed class UploadedByDto with _$UploadedByDto {
  const factory UploadedByDto({
    required String id,
    required String name,
    String? division,
  }) = _UploadedByDto;

  factory UploadedByDto.fromJson(Map<String, dynamic> json) =>
      _$UploadedByDtoFromJson(json);
}
