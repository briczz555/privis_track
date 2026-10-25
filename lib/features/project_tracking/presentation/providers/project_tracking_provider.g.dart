// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Composition root fitur: satu instance repository dipakai bersama oleh
/// semua usecase. Fase 2 cukup menyisipkan `ref.watch(dioProvider)` di sini.

@ProviderFor(projectTrackingRepository)
final projectTrackingRepositoryProvider = ProjectTrackingRepositoryProvider._();

/// Composition root fitur: satu instance repository dipakai bersama oleh
/// semua usecase. Fase 2 cukup menyisipkan `ref.watch(dioProvider)` di sini.

final class ProjectTrackingRepositoryProvider
    extends
        $FunctionalProvider<
          ProjectTrackingRepository,
          ProjectTrackingRepository,
          ProjectTrackingRepository
        >
    with $Provider<ProjectTrackingRepository> {
  /// Composition root fitur: satu instance repository dipakai bersama oleh
  /// semua usecase. Fase 2 cukup menyisipkan `ref.watch(dioProvider)` di sini.
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
    r'f6d0de64a74436b57a9cc155a8e3e602e568626c';

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
    r'658e9e2d52f445c892ebc267cfaac8c50a28a644';

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

  ProjectTrackingNotifierProvider call(String projectId) =>
      ProjectTrackingNotifierProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectTrackingProvider';
}

abstract class _$ProjectTrackingNotifier
    extends $AsyncNotifier<ProjectTrackingEntity> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  FutureOr<ProjectTrackingEntity> build(String projectId);
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
