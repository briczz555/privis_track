import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta_dto.freezed.dart';
part 'pagination_meta_dto.g.dart';

@freezed
sealed class PaginationMetaDto with _$PaginationMetaDto {
  const factory PaginationMetaDto({
    required int page,
    required int limit,
    required int total,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'status_counts')
    @Default(<String, int>{})
    Map<String, int> statusCounts,
  }) = _PaginationMetaDto;

  factory PaginationMetaDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaDtoFromJson(json);
}
