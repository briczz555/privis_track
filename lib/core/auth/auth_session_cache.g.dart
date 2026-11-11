// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authSessionCache)
final authSessionCacheProvider = AuthSessionCacheProvider._();

final class AuthSessionCacheProvider
    extends
        $FunctionalProvider<
          AuthSessionCache,
          AuthSessionCache,
          AuthSessionCache
        >
    with $Provider<AuthSessionCache> {
  AuthSessionCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionCacheHash();

  @$internal
  @override
  $ProviderElement<AuthSessionCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthSessionCache create(Ref ref) {
    return authSessionCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthSessionCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthSessionCache>(value),
    );
  }
}

String _$authSessionCacheHash() => r'61d36352b57cb4ffda438a5971581cbca5367814';
