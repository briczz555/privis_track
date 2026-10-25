import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/stage_document_entity.dart';
import '../../domain/entities/stage_document_type.dart';
import '../dto/stage_document_dto.dart';

part 'stage_document_model.freezed.dart';

@freezed
sealed class StageDocumentModel with _$StageDocumentModel {
  const StageDocumentModel._();

  const factory StageDocumentModel({
    required String id,
    required String name,
    required StageDocumentType type,
    required String url,
    required String uploadedBy,
    required DateTime uploadedAt,
  }) = _StageDocumentModel;

  factory StageDocumentModel.fromDto(StageDocumentDto dto) =>
      StageDocumentModel(
        id: dto.id,
        name: dto.name,
        type: _typeFromApi(dto.type),
        url: dto.url,
        uploadedBy: dto.uploadedBy,
        uploadedAt: DateTime.parse(dto.uploadedAt),
      );

  StageDocumentEntity toEntity() => StageDocumentEntity(
    id: id,
    name: name,
    type: type,
    url: url,
    uploadedBy: uploadedBy,
    uploadedAt: uploadedAt,
  );
}

StageDocumentType _typeFromApi(String value) => switch (value.toLowerCase()) {
  'pdf' => StageDocumentType.pdf,
  'spreadsheet' || 'xlsx' || 'xls' || 'csv' => StageDocumentType.spreadsheet,
  'image' || 'png' || 'jpg' || 'jpeg' => StageDocumentType.image,
  'design' || 'fig' || 'sketch' => StageDocumentType.design,
  'document' || 'doc' || 'docx' => StageDocumentType.document,
  _ => StageDocumentType.other,
};
