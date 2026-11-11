import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/activity_entity.dart';
import '../dto/activity_dto.dart';

part 'activity_model.freezed.dart';

@freezed
sealed class ActivityModel with _$ActivityModel {
  const ActivityModel._();

  const factory ActivityModel({
    required String id,
    required String type,
    required String actor,
    required String division,
    required String action,
    required String target,
    required String projectCode,
    required String projectName,
    required DateTime occurredAt,
  }) = _ActivityModel;

  factory ActivityModel.fromDto(ActivityDto dto) => ActivityModel(
    id: dto.id,
    type: dto.type,
    actor: dto.actor.name,
    division: dto.actor.division ?? '',
    action: dto.action,
    target: dto.target,
    projectCode: dto.project.code,
    projectName: dto.project.name,
    occurredAt: DateTime.parse(dto.createdAt),
  );

  ActivityEntity toEntity() => ActivityEntity(
    id: id,
    type: type,
    actor: actor,
    division: division,
    action: action,
    target: target,
    projectCode: projectCode,
    projectName: projectName,
    occurredAt: occurredAt,
  );
}
