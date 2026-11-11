import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../domain/entities/portfolio_slice_entity.dart';
import '../dto/portfolio_slice_dto.dart';

part 'portfolio_slice_model.freezed.dart';

@freezed
sealed class PortfolioSliceModel with _$PortfolioSliceModel {
  const PortfolioSliceModel._();

  const factory PortfolioSliceModel({
    required ProjectStatus status,
    required int count,
    required double percentage,
  }) = _PortfolioSliceModel;

  factory PortfolioSliceModel.fromDto(PortfolioSliceDto dto) =>
      PortfolioSliceModel(
        status: projectStatusFromApi(dto.status),
        count: dto.count,
        percentage: dto.percentage,
      );

  PortfolioSliceEntity toEntity() => PortfolioSliceEntity(
    status: status,
    count: count,
    percentage: percentage,
  );
}
