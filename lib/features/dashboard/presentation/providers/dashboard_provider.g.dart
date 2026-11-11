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
    r'9498c1f4ad2d0c93d05f75a8d3a7ce72a43f98e4';

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

String _$dashboardNotifierHash() => r'720b9fe5c46b63513ad760b3e2f655222a24ba97';

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
final allProjectsProvider = AllProjectsNotifierProvider._();

final class AllProjectsNotifierProvider
    extends $AsyncNotifierProvider<AllProjectsNotifier, ProjectListEntity> {
  AllProjectsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allProjectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allProjectsNotifierHash();

  @$internal
  @override
  AllProjectsNotifier create() => AllProjectsNotifier();
}

String _$allProjectsNotifierHash() =>
    r'2a6a24732777d5d1d81ad34439030b2a767c1193';

abstract class _$AllProjectsNotifier extends $AsyncNotifier<ProjectListEntity> {
  FutureOr<ProjectListEntity> build();
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
    return element.handleCreate(ref, build);
  }
}
