// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StageDocumentDto _$StageDocumentDtoFromJson(Map<String, dynamic> json) =>
    _StageDocumentDto(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      mimeType: json['mime_type'] as String?,
      sizeBytes: (json['size_bytes'] as num?)?.toInt(),
      uploadedBy: UploadedByDto.fromJson(
        json['uploaded_by'] as Map<String, dynamic>,
      ),
      uploadedAt: json['uploaded_at'] as String,
    );

Map<String, dynamic> _$StageDocumentDtoToJson(_StageDocumentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'mime_type': instance.mimeType,
      'size_bytes': instance.sizeBytes,
      'uploaded_by': instance.uploadedBy,
      'uploaded_at': instance.uploadedAt,
    };
