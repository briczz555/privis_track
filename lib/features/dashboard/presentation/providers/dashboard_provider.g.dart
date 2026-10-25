// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'3ce5bfab2acdf0fd133c0b4ff1b18fa0ae460ddf';

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
