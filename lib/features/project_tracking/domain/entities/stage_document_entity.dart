import 'package:freezed_annotation/freezed_annotation.dart';

import 'stage_document_type.dart';

part 'stage_document_entity.freezed.dart';

@freezed
sealed class StageDocumentEntity with _$StageDocumentEntity {
  const factory StageDocumentEntity({
    required String id,
    required String name,
    required StageDocumentType type,
    required String url,
    required String uploadedBy,
    required DateTime uploadedAt,
  }) = _StageDocumentEntity;
}
