// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/project_management_remote_data_source.dart';
import '../../data/repositories/project_management_repository_impl.dart';
import '../../domain/entities/client_option_entity.dart';
import '../../domain/repositories/project_management_repository.dart';
import '../../domain/usecases/create_project_usecase.dart';
import '../../domain/usecases/get_clients_usecase.dart';
import '../../domain/usecases/update_project_details_usecase.dart';

part 'project_management_provider.g.dart';

@riverpod
ProjectManagementRepository projectManagementRepository(Ref ref) {
  return ProjectManagementRepositoryImpl(
    ProjectManagementRemoteDataSource(ref.watch(dioProvider)),
  );
}

@riverpod
GetClientsUsecase getClientsUsecase(Ref ref) {
  return GetClientsUsecase(ref.watch(projectManagementRepositoryProvider));
}

@riverpod
CreateProjectUsecase createProjectUsecase(Ref ref) {
  return CreateProjectUsecase(ref.watch(projectManagementRepositoryProvider));
}

@riverpod
UpdateProjectDetailsUsecase updateProjectDetailsUsecase(Ref ref) {
  return UpdateProjectDetailsUsecase(
    ref.watch(projectManagementRepositoryProvider),
  );
}

@riverpod
Future<List<ClientOptionEntity>> clientOptions(Ref ref) {
  return ref.watch(getClientsUsecaseProvider).call();
}
