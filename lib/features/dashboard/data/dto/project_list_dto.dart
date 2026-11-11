import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_meta_dto.dart';
import 'project_summary_dto.dart';

part 'project_list_dto.freezed.dart';
part 'project_list_dto.g.dart';

@freezed
sealed class ProjectListDto with _$ProjectListDto {
  const factory ProjectListDto({
    required List<ProjectSummaryDto> data,
    required PaginationMetaDto meta,
  }) = _ProjectListDto;

  factory ProjectListDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectListDtoFromJson(json);
}
