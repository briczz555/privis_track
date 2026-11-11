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
    r'2b7a0f121eee5669a3cd26f50f737f06b2881bf4';

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
