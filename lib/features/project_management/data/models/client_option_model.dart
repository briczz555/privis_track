import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/client_option_entity.dart';
import '../dto/client_option_dto.dart';

part 'client_option_model.freezed.dart';

@freezed
sealed class ClientOptionModel with _$ClientOptionModel {
  const ClientOptionModel._();

  const factory ClientOptionModel({required String id, required String name}) =
      _ClientOptionModel;

  factory ClientOptionModel.fromDto(ClientOptionDto dto) =>
      ClientOptionModel(id: dto.id, name: dto.name);

  ClientOptionEntity toEntity() => ClientOptionEntity(id: id, name: name);
}
