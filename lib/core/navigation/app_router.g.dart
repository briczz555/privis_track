// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Instance GoRouter tunggal untuk seluruh aplikasi.
/// File ini hanya mengonsumsi `appRoutes` dari routes.dart — JANGAN
/// mendefinisikan GoRoute individual langsung di sini.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// Instance GoRouter tunggal untuk seluruh aplikasi.
/// File ini hanya mengonsumsi `appRoutes` dari routes.dart — JANGAN
/// mendefinisikan GoRoute individual langsung di sini.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Instance GoRouter tunggal untuk seluruh aplikasi.
  /// File ini hanya mengonsumsi `appRoutes` dari routes.dart — JANGAN
  /// mendefinisikan GoRoute individual langsung di sini.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'fbaea7aa849644982a9461affe0a7e93eb6b9d3e';
