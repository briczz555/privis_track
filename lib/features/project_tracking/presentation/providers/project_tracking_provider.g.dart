// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectTrackingRepository)
final projectTrackingRepositoryProvider = ProjectTrackingRepositoryProvider._();

final class ProjectTrackingRepositoryProvider
    extends
        $FunctionalProvider<
          ProjectTrackingRepository,
          ProjectTrackingRepository,
          ProjectTrackingRepository
        >
    with $Provider<ProjectTrackingRepository> {
  ProjectTrackingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectTrackingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectTrackingRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProjectTrackingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjectTrackingRepository create(Ref ref) {
    return projectTrackingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectTrackingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectTrackingRepository>(value),
    );
  }
}

String _$projectTrackingRepositoryHash() =>
    r'ca418990d5444393e47abe4d99f3f2110d82160a';

@ProviderFor(getProjectTrackingUsecase)
final getProjectTrackingUsecaseProvider = GetProjectTrackingUsecaseProvider._();

final class GetProjectTrackingUsecaseProvider
    extends
        $FunctionalProvider<
          GetProjectTrackingUsecase,
          GetProjectTrackingUsecase,
          GetProjectTrackingUsecase
        >
    with $Provider<GetProjectTrackingUsecase> {
  GetProjectTrackingUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProjectTrackingUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProjectTrackingUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProjectTrackingUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProjectTrackingUsecase create(Ref ref) {
    return getProjectTrackingUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectTrackingUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectTrackingUsecase>(value),
    );
  }
}

String _$getProjectTrackingUsecaseHash() =>
    r'5143743f2d6759de0c5d46f0099005b089fc162f';

@ProviderFor(uploadStageDocumentUsecase)
final uploadStageDocumentUsecaseProvider =
    UploadStageDocumentUsecaseProvider._();

final class UploadStageDocumentUsecaseProvider
    extends
        $FunctionalProvider<
          UploadStageDocumentUsecase,
          UploadStageDocumentUsecase,
          UploadStageDocumentUsecase
        >
    with $Provider<UploadStageDocumentUsecase> {
  UploadStageDocumentUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadStageDocumentUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadStageDocumentUsecaseHash();

  @$internal
  @override
  $ProviderElement<UploadStageDocumentUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UploadStageDocumentUsecase create(Ref ref) {
    return uploadStageDocumentUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadStageDocumentUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadStageDocumentUsecase>(value),
    );
  }
}

String _$uploadStageDocumentUsecaseHash() =>
    r'946687e53337dc94410fc09e4cdab8c09cccea34';

@ProviderFor(downloadDocumentUsecase)
final downloadDocumentUsecaseProvider = DownloadDocumentUsecaseProvider._();

final class DownloadDocumentUsecaseProvider
    extends
        $FunctionalProvider<
          DownloadDocumentUsecase,
          DownloadDocumentUsecase,
          DownloadDocumentUsecase
        >
    with $Provider<DownloadDocumentUsecase> {
  DownloadDocumentUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadDocumentUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadDocumentUsecaseHash();

  @$internal
  @override
  $ProviderElement<DownloadDocumentUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DownloadDocumentUsecase create(Ref ref) {
    return downloadDocumentUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadDocumentUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadDocumentUsecase>(value),
    );
  }
}

String _$downloadDocumentUsecaseHash() =>
    r'c7fdb68b8501e7c2b6bd3216b48229199329eece';

@ProviderFor(updateStageUsecase)
final updateStageUsecaseProvider = UpdateStageUsecaseProvider._();

final class UpdateStageUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateStageUsecase,
          UpdateStageUsecase,
          UpdateStageUsecase
        >
    with $Provider<UpdateStageUsecase> {
  UpdateStageUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateStageUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateStageUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateStageUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateStageUsecase create(Ref ref) {
    return updateStageUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateStageUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateStageUsecase>(value),
    );
  }
}

String _$updateStageUsecaseHash() =>
    r'9ba6241eddae7bf5e3c2f91e374b5d169218adcf';

@ProviderFor(updateProjectStatusUsecase)
final updateProjectStatusUsecaseProvider =
    UpdateProjectStatusUsecaseProvider._();

final class UpdateProjectStatusUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateProjectStatusUsecase,
          UpdateProjectStatusUsecase,
          UpdateProjectStatusUsecase
        >
    with $Provider<UpdateProjectStatusUsecase> {
  UpdateProjectStatusUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProjectStatusUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateProjectStatusUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateProjectStatusUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateProjectStatusUsecase create(Ref ref) {
    return updateProjectStatusUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateProjectStatusUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateProjectStatusUsecase>(value),
    );
  }
}

String _$updateProjectStatusUsecaseHash() =>
    r'c6a6b79df601e6d177b31054a27703fe1d2495c7';

@ProviderFor(ProjectTrackingNotifier)
final projectTrackingProvider = ProjectTrackingNotifierFamily._();

final class ProjectTrackingNotifierProvider
    extends
        $AsyncNotifierProvider<ProjectTrackingNotifier, ProjectTrackingEntity> {
  ProjectTrackingNotifierProvider._({
    required ProjectTrackingNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'projectTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectTrackingNotifierHash();

  @override
  String toString() {
    return r'projectTrackingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectTrackingNotifier create() => ProjectTrackingNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProjectTrackingNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectTrackingNotifierHash() =>
    r'491feda52cbf945ae78e419c0befe3beb5156022';

final class ProjectTrackingNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectTrackingNotifier,
          AsyncValue<ProjectTrackingEntity>,
          ProjectTrackingEntity,
          FutureOr<ProjectTrackingEntity>,
          String
        > {
  ProjectTrackingNotifierFamily._()
    : super(
        retry: null,
        name: r'projectTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectTrackingNotifierProvider call(String projectCode) =>
      ProjectTrackingNotifierProvider._(argument: projectCode, from: this);

  @override
  String toString() => r'projectTrackingProvider';
}

abstract class _$ProjectTrackingNotifier
    extends $AsyncNotifier<ProjectTrackingEntity> {
  late final _$args = ref.$arg as String;
  String get projectCode => _$args;

  FutureOr<ProjectTrackingEntity> build(String projectCode);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ProjectTrackingEntity>, ProjectTrackingEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ProjectTrackingEntity>,
                ProjectTrackingEntity
              >,
              AsyncValue<ProjectTrackingEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
