import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project_stage_entity.dart';
import '../dto/project_stage_dto.dart';
import 'stage_document_model.dart';

part 'project_stage_model.freezed.dart';

@freezed
sealed class ProjectStageModel with _$ProjectStageModel {
  const ProjectStageModel._();

  const factory ProjectStageModel({
    required int id,
    required String title,
    required bool isCompleted,
    DateTime? completedAt,
    @Default(<StageDocumentModel>[]) List<StageDocumentModel> documents,
  }) = _ProjectStageModel;

  factory ProjectStageModel.fromDto(ProjectStageDto dto) => ProjectStageModel(
    id: dto.id,
    title: dto.title,
    isCompleted: dto.isCompleted,
    completedAt: switch (dto.completedAt) {
      final String raw => DateTime.tryParse(raw),
      _ => null,
    },
    documents: dto.documents
        .map(StageDocumentModel.fromDto)
        .toList(growable: false),
  );

  ProjectStageEntity toEntity() => ProjectStageEntity(
    id: id,
    title: title,
    isCompleted: isCompleted,
    completedAt: completedAt,
    documents: documents
        .map((document) => document.toEntity())
        .toList(growable: false),
  );
}
