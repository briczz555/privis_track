import 'package:freezed_annotation/freezed_annotation.dart';

import 'project_entity.dart';

part 'project_list_entity.freezed.dart';

@freezed
sealed class ProjectListEntity with _$ProjectListEntity {
  const factory ProjectListEntity({
    required List<ProjectEntity> projects,
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    @Default(false) bool isFromCache,
    DateTime? cachedAt,
  }) = _ProjectListEntity;
}
