import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';

part 'portfolio_slice_entity.freezed.dart';

@freezed
sealed class PortfolioSliceEntity with _$PortfolioSliceEntity {
  const factory PortfolioSliceEntity({
    required ProjectStatus status,
    required int count,
    required double percentage,
  }) = _PortfolioSliceEntity;
}
