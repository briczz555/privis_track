import 'package:freezed_annotation/freezed_annotation.dart';

import 'uploaded_by_dto.dart';

part 'stage_document_dto.freezed.dart';
part 'stage_document_dto.g.dart';

@freezed
sealed class StageDocumentDto with _$StageDocumentDto {
  const factory StageDocumentDto({
    required String id,
    required String name,
    required String type,
    @JsonKey(name: 'mime_type') String? mimeType,
    @JsonKey(name: 'size_bytes') int? sizeBytes,
    @JsonKey(name: 'uploaded_by') required UploadedByDto uploadedBy,
    @JsonKey(name: 'uploaded_at') required String uploadedAt,
  }) = _StageDocumentDto;

  factory StageDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$StageDocumentDtoFromJson(json);
}
