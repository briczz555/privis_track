import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/activity_entity.dart';
import '../dto/activity_dto.dart';

part 'activity_model.freezed.dart';

@freezed
sealed class ActivityModel with _$ActivityModel {
  const ActivityModel._();

  const factory ActivityModel({
    required String id,
    required String actor,
    required String division,
    required String action,
    required String target,
    required String projectName,
    required DateTime occurredAt,
  }) = _ActivityModel;

  factory ActivityModel.fromDto(ActivityDto dto) => ActivityModel(
    id: dto.id,
    actor: dto.actor,
    division: dto.division,
    action: dto.action,
    target: dto.target,
    projectName: dto.projectName,
    occurredAt: DateTime.parse(dto.occurredAt),
  );

  ActivityEntity toEntity() => ActivityEntity(
    id: id,
    actor: actor,
    division: division,
    action: action,
    target: target,
    projectName: projectName,
    occurredAt: occurredAt,
  );
}
