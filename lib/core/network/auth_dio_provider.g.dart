// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Dio khusus auth (login/refresh/logout) tanpa AuthInterceptor, supaya proses
/// refresh tidak memicu loop 401.

@ProviderFor(authDio)
final authDioProvider = AuthDioProvider._();

/// Dio khusus auth (login/refresh/logout) tanpa AuthInterceptor, supaya proses
/// refresh tidak memicu loop 401.

final class AuthDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Dio khusus auth (login/refresh/logout) tanpa AuthInterceptor, supaya proses
  /// refresh tidak memicu loop 401.
  AuthDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return authDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$authDioHash() => r'07a93ada893cccda8b9239f35652ecc35c66763a';
