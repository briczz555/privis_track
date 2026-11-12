import 'package:freezed_annotation/freezed_annotation.dart';

import '../dto/pagination_meta_dto.dart';

part 'pagination_meta_model.freezed.dart';

@freezed
sealed class PaginationMetaModel with _$PaginationMetaModel {
  const factory PaginationMetaModel({
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    @Default(<String, int>{}) Map<String, int> statusCounts,
  }) = _PaginationMetaModel;

  factory PaginationMetaModel.fromDto(PaginationMetaDto dto) =>
      PaginationMetaModel(
        page: dto.page,
        limit: dto.limit,
        total: dto.total,
        totalPages: dto.totalPages,
        statusCounts: dto.statusCounts,
      );
}
