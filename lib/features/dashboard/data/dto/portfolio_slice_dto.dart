import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_slice_dto.freezed.dart';
part 'portfolio_slice_dto.g.dart';

@freezed
sealed class PortfolioSliceDto with _$PortfolioSliceDto {
  const factory PortfolioSliceDto({
    required String status,
    required int count,
    required double percentage,
  }) = _PortfolioSliceDto;

  factory PortfolioSliceDto.fromJson(Map<String, dynamic> json) =>
      _$PortfolioSliceDtoFromJson(json);
}
