import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_summary_dto.freezed.dart';
part 'client_summary_dto.g.dart';

@freezed
sealed class ClientSummaryDto with _$ClientSummaryDto {
  const factory ClientSummaryDto({required String id, required String name}) =
      _ClientSummaryDto;

  factory ClientSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ClientSummaryDtoFromJson(json);
}
