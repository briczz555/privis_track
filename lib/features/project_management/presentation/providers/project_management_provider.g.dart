// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_management_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectManagementRepository)
final projectManagementRepositoryProvider =
    ProjectManagementRepositoryProvider._();

final class ProjectManagementRepositoryProvider
    extends
        $FunctionalProvider<
          ProjectManagementRepository,
          ProjectManagementRepository,
          ProjectManagementRepository
        >
    with $Provider<ProjectManagementRepository> {
  ProjectManagementRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectManagementRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectManagementRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProjectManagementRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjectManagementRepository create(Ref ref) {
    return projectManagementRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectManagementRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectManagementRepository>(value),
    );
  }
}

String _$projectManagementRepositoryHash() =>
    r'9f8cbf8048c69458f4109a61a4ef898ccea2a6d1';

@ProviderFor(getClientsUsecase)
final getClientsUsecaseProvider = GetClientsUsecaseProvider._();

final class GetClientsUsecaseProvider
    extends
        $FunctionalProvider<
          GetClientsUsecase,
          GetClientsUsecase,
          GetClientsUsecase
        >
    with $Provider<GetClientsUsecase> {
  GetClientsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getClientsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getClientsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetClientsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetClientsUsecase create(Ref ref) {
    return getClientsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetClientsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetClientsUsecase>(value),
    );
  }
}

String _$getClientsUsecaseHash() => r'29578640658f45e7e755a49d374a0475e84a77f5';

@ProviderFor(createProjectUsecase)
final createProjectUsecaseProvider = CreateProjectUsecaseProvider._();

final class CreateProjectUsecaseProvider
    extends
        $FunctionalProvider<
          CreateProjectUsecase,
          CreateProjectUsecase,
          CreateProjectUsecase
        >
    with $Provider<CreateProjectUsecase> {
  CreateProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createProjectUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateProjectUsecase create(Ref ref) {
    return createProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateProjectUsecase>(value),
    );
  }
}

String _$createProjectUsecaseHash() =>
    r'85765fce4ac413ff3b03746f479baf4c961c2c96';

@ProviderFor(updateProjectDetailsUsecase)
final updateProjectDetailsUsecaseProvider =
    UpdateProjectDetailsUsecaseProvider._();

final class UpdateProjectDetailsUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateProjectDetailsUsecase,
          UpdateProjectDetailsUsecase,
          UpdateProjectDetailsUsecase
        >
    with $Provider<UpdateProjectDetailsUsecase> {
  UpdateProjectDetailsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProjectDetailsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateProjectDetailsUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateProjectDetailsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateProjectDetailsUsecase create(Ref ref) {
    return updateProjectDetailsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateProjectDetailsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateProjectDetailsUsecase>(value),
    );
  }
}

String _$updateProjectDetailsUsecaseHash() =>
    r'8ca05a6cb8d76d4eb05fb58071a13ba15cf5206f';

@ProviderFor(clientOptions)
final clientOptionsProvider = ClientOptionsProvider._();

final class ClientOptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ClientOptionEntity>>,
          List<ClientOptionEntity>,
          FutureOr<List<ClientOptionEntity>>
        >
    with
        $FutureModifier<List<ClientOptionEntity>>,
        $FutureProvider<List<ClientOptionEntity>> {
  ClientOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientOptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientOptionsHash();

  @$internal
  @override
  $FutureProviderElement<List<ClientOptionEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ClientOptionEntity>> create(Ref ref) {
    return clientOptions(ref);
  }
}

String _$clientOptionsHash() => r'6587269cbdb9953d4f289686e04dbb1ef181006c';
