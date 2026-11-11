import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_entity.freezed.dart';

@freezed
sealed class ActivityEntity with _$ActivityEntity {
  const factory ActivityEntity({
    required String id,
    required String type,
    required String actor,
    required String division,
    required String action,
    required String target,
    required String projectCode,
    required String projectName,
    required DateTime occurredAt,
  }) = _ActivityEntity;
}
