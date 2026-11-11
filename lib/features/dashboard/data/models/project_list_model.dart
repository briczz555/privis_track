import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project_list_entity.dart';
import '../dto/project_list_dto.dart';
import 'pagination_meta_model.dart';
import 'project_model.dart';

part 'project_list_model.freezed.dart';

@freezed
sealed class ProjectListModel with _$ProjectListModel {
  const ProjectListModel._();

  const factory ProjectListModel({
    required List<ProjectModel> projects,
    required PaginationMetaModel meta,
  }) = _ProjectListModel;

  factory ProjectListModel.fromDto(ProjectListDto dto) => ProjectListModel(
    projects: dto.data.map(ProjectModel.fromDto).toList(growable: false),
    meta: PaginationMetaModel.fromDto(dto.meta),
  );

  ProjectListEntity toEntity() => ProjectListEntity(
    projects: projects
        .map((project) => project.toEntity())
        .toList(growable: false),
    page: meta.page,
    limit: meta.limit,
    total: meta.total,
    totalPages: meta.totalPages,
  );
}
