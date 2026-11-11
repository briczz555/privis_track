// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          IAuthRemoteDataSource,
          IAuthRemoteDataSource,
          IAuthRemoteDataSource
        >
    with $Provider<IAuthRemoteDataSource> {
  AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<IAuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IAuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'fdbcfa0ff283243027c8595363e42c7ba0cad9f5';

@ProviderFor(authLocalDataSource)
final authLocalDataSourceProvider = AuthLocalDataSourceProvider._();

final class AuthLocalDataSourceProvider
    extends
        $FunctionalProvider<
          IAuthLocalDataSource,
          IAuthLocalDataSource,
          IAuthLocalDataSource
        >
    with $Provider<IAuthLocalDataSource> {
  AuthLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<IAuthLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IAuthLocalDataSource create(Ref ref) {
    return authLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthLocalDataSource>(value),
    );
  }
}

String _$authLocalDataSourceHash() =>
    r'14140e0b7977ab79a82595875c516057f65bec17';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'67eccf2df71935898c918e698c5165f59640d5d8';

@ProviderFor(loginUsecase)
final loginUsecaseProvider = LoginUsecaseProvider._();

final class LoginUsecaseProvider
    extends $FunctionalProvider<LoginUsecase, LoginUsecase, LoginUsecase>
    with $Provider<LoginUsecase> {
  LoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUsecase create(Ref ref) {
    return loginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUsecase>(value),
    );
  }
}

String _$loginUsecaseHash() => r'0564b41939ce8306781effac4171478398541a54';

@ProviderFor(refreshSessionUsecase)
final refreshSessionUsecaseProvider = RefreshSessionUsecaseProvider._();

final class RefreshSessionUsecaseProvider
    extends
        $FunctionalProvider<
          RefreshSessionUsecase,
          RefreshSessionUsecase,
          RefreshSessionUsecase
        >
    with $Provider<RefreshSessionUsecase> {
  RefreshSessionUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshSessionUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshSessionUsecaseHash();

  @$internal
  @override
  $ProviderElement<RefreshSessionUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RefreshSessionUsecase create(Ref ref) {
    return refreshSessionUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RefreshSessionUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RefreshSessionUsecase>(value),
    );
  }
}

String _$refreshSessionUsecaseHash() =>
    r'9f25592a49d42239ef069855ec6422a796c1aec6';

@ProviderFor(restoreSessionUsecase)
final restoreSessionUsecaseProvider = RestoreSessionUsecaseProvider._();

final class RestoreSessionUsecaseProvider
    extends
        $FunctionalProvider<
          RestoreSessionUsecase,
          RestoreSessionUsecase,
          RestoreSessionUsecase
        >
    with $Provider<RestoreSessionUsecase> {
  RestoreSessionUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restoreSessionUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restoreSessionUsecaseHash();

  @$internal
  @override
  $ProviderElement<RestoreSessionUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RestoreSessionUsecase create(Ref ref) {
    return restoreSessionUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RestoreSessionUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RestoreSessionUsecase>(value),
    );
  }
}

String _$restoreSessionUsecaseHash() =>
    r'bcc061f159b741896b7d87dda74b79db1950e67e';

@ProviderFor(logoutUsecase)
final logoutUsecaseProvider = LogoutUsecaseProvider._();

final class LogoutUsecaseProvider
    extends $FunctionalProvider<LogoutUsecase, LogoutUsecase, LogoutUsecase>
    with $Provider<LogoutUsecase> {
  LogoutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUsecaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUsecase create(Ref ref) {
    return logoutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUsecase>(value),
    );
  }
}

String _$logoutUsecaseHash() => r'd5f3c8b42bfe2a45f8876f8a5d4993d31c0295a8';

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, AuthSessionEntity?> {
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'd7484e627ed9405c58fcf0849786230691050dd0';

abstract class _$AuthController extends $AsyncNotifier<AuthSessionEntity?> {
  FutureOr<AuthSessionEntity?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<AuthSessionEntity?>, AuthSessionEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthSessionEntity?>, AuthSessionEntity?>,
              AsyncValue<AuthSessionEntity?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
