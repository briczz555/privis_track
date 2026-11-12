// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider = DashboardRepositoryProvider._();

final class DashboardRepositoryProvider
    extends
        $FunctionalProvider<
          DashboardRepository,
          DashboardRepository,
          DashboardRepository
        >
    with $Provider<DashboardRepository> {
  DashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<DashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardRepository create(Ref ref) {
    return dashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardRepository>(value),
    );
  }
}

String _$dashboardRepositoryHash() =>
    r'8d08bd9b2ea01c15cccaa8756bce93c1bc223d2a';

@ProviderFor(getDashboardUsecase)
final getDashboardUsecaseProvider = GetDashboardUsecaseProvider._();

final class GetDashboardUsecaseProvider
    extends
        $FunctionalProvider<
          GetDashboardUsecase,
          GetDashboardUsecase,
          GetDashboardUsecase
        >
    with $Provider<GetDashboardUsecase> {
  GetDashboardUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDashboardUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDashboardUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetDashboardUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetDashboardUsecase create(Ref ref) {
    return getDashboardUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetDashboardUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetDashboardUsecase>(value),
    );
  }
}

String _$getDashboardUsecaseHash() =>
    r'38502aec725740e8d632b2a34dd57d2cbeac2623';

@ProviderFor(getProjectsUsecase)
final getProjectsUsecaseProvider = GetProjectsUsecaseProvider._();

final class GetProjectsUsecaseProvider
    extends
        $FunctionalProvider<
          GetProjectsUsecase,
          GetProjectsUsecase,
          GetProjectsUsecase
        >
    with $Provider<GetProjectsUsecase> {
  GetProjectsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProjectsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProjectsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProjectsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProjectsUsecase create(Ref ref) {
    return getProjectsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectsUsecase>(value),
    );
  }
}

String _$getProjectsUsecaseHash() =>
    r'581565a61ecd142e451c63d8201e9c883fdda9c1';

@ProviderFor(DashboardNotifier)
final dashboardProvider = DashboardNotifierProvider._();

final class DashboardNotifierProvider
    extends $AsyncNotifierProvider<DashboardNotifier, DashboardEntity> {
  DashboardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardNotifierHash();

  @$internal
  @override
  DashboardNotifier create() => DashboardNotifier();
}

String _$dashboardNotifierHash() => r'8162bdcc208f41ccd7d05c5ffc81e2d3d8ed1680';

abstract class _$DashboardNotifier extends $AsyncNotifier<DashboardEntity> {
  FutureOr<DashboardEntity> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DashboardEntity>, DashboardEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DashboardEntity>, DashboardEntity>,
              AsyncValue<DashboardEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(AllProjectsNotifier)
final allProjectsProvider = AllProjectsNotifierFamily._();

final class AllProjectsNotifierProvider
    extends $AsyncNotifierProvider<AllProjectsNotifier, ProjectListEntity> {
  AllProjectsNotifierProvider._({
    required AllProjectsNotifierFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'allProjectsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allProjectsNotifierHash();

  @override
  String toString() {
    return r'allProjectsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AllProjectsNotifier create() => AllProjectsNotifier();

  @override
  bool operator ==(Object other) {
    return other is AllProjectsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allProjectsNotifierHash() =>
    r'794be283d3eb2e62db844828d85871a1113d113c';

final class AllProjectsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AllProjectsNotifier,
          AsyncValue<ProjectListEntity>,
          ProjectListEntity,
          FutureOr<ProjectListEntity>,
          String?
        > {
  AllProjectsNotifierFamily._()
    : super(
        retry: null,
        name: r'allProjectsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllProjectsNotifierProvider call(String? statusApi) =>
      AllProjectsNotifierProvider._(argument: statusApi, from: this);

  @override
  String toString() => r'allProjectsProvider';
}

abstract class _$AllProjectsNotifier extends $AsyncNotifier<ProjectListEntity> {
  late final _$args = ref.$arg as String?;
  String? get statusApi => _$args;

  FutureOr<ProjectListEntity> build(String? statusApi);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectListEntity>, ProjectListEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectListEntity>, ProjectListEntity>,
              AsyncValue<ProjectListEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
