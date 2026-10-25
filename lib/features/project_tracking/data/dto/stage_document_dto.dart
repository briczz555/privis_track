import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage_document_dto.freezed.dart';
part 'stage_document_dto.g.dart';

/// Bentuk mentah satu dokumen arsip sesuai payload API.
@freezed
sealed class StageDocumentDto with _$StageDocumentDto {
  const factory StageDocumentDto({
    required String id,
    required String name,
    required String type,
    required String url,
    @JsonKey(name: 'uploaded_by') required String uploadedBy,
    @JsonKey(name: 'uploaded_at') required String uploadedAt,
  }) = _StageDocumentDto;

  factory StageDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$StageDocumentDtoFromJson(json);
}
