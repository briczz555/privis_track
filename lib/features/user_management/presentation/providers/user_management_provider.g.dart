// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_management_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userManagementRepository)
final userManagementRepositoryProvider = UserManagementRepositoryProvider._();

final class UserManagementRepositoryProvider
    extends
        $FunctionalProvider<
          UserManagementRepository,
          UserManagementRepository,
          UserManagementRepository
        >
    with $Provider<UserManagementRepository> {
  UserManagementRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userManagementRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userManagementRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserManagementRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserManagementRepository create(Ref ref) {
    return userManagementRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserManagementRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserManagementRepository>(value),
    );
  }
}

String _$userManagementRepositoryHash() =>
    r'ca9b2a68e7961d611b185e0d1540cdb973d04ed2';

@ProviderFor(getUsersUsecase)
final getUsersUsecaseProvider = GetUsersUsecaseProvider._();

final class GetUsersUsecaseProvider
    extends
        $FunctionalProvider<GetUsersUsecase, GetUsersUsecase, GetUsersUsecase>
    with $Provider<GetUsersUsecase> {
  GetUsersUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUsersUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUsersUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetUsersUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUsersUsecase create(Ref ref) {
    return getUsersUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUsersUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUsersUsecase>(value),
    );
  }
}

String _$getUsersUsecaseHash() => r'b1b7ede8b200bf21d0577ccdb3239d712499448f';

@ProviderFor(createUserUsecase)
final createUserUsecaseProvider = CreateUserUsecaseProvider._();

final class CreateUserUsecaseProvider
    extends
        $FunctionalProvider<
          CreateUserUsecase,
          CreateUserUsecase,
          CreateUserUsecase
        >
    with $Provider<CreateUserUsecase> {
  CreateUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateUserUsecase create(Ref ref) {
    return createUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateUserUsecase>(value),
    );
  }
}

String _$createUserUsecaseHash() => r'b997883c96c21acf123e4b9301b51d2a9ecdcb2e';

@ProviderFor(updateUserUsecase)
final updateUserUsecaseProvider = UpdateUserUsecaseProvider._();

final class UpdateUserUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateUserUsecase,
          UpdateUserUsecase,
          UpdateUserUsecase
        >
    with $Provider<UpdateUserUsecase> {
  UpdateUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateUserUsecase create(Ref ref) {
    return updateUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateUserUsecase>(value),
    );
  }
}

String _$updateUserUsecaseHash() => r'64bfb15694a2694afab0225b17f6ee66b7357600';

@ProviderFor(resetUserPasswordUsecase)
final resetUserPasswordUsecaseProvider = ResetUserPasswordUsecaseProvider._();

final class ResetUserPasswordUsecaseProvider
    extends
        $FunctionalProvider<
          ResetUserPasswordUsecase,
          ResetUserPasswordUsecase,
          ResetUserPasswordUsecase
        >
    with $Provider<ResetUserPasswordUsecase> {
  ResetUserPasswordUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetUserPasswordUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetUserPasswordUsecaseHash();

  @$internal
  @override
  $ProviderElement<ResetUserPasswordUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResetUserPasswordUsecase create(Ref ref) {
    return resetUserPasswordUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetUserPasswordUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetUserPasswordUsecase>(value),
    );
  }
}

String _$resetUserPasswordUsecaseHash() =>
    r'e143eb024bf6f097ce75684f1c0d28d02eb81ae9';

@ProviderFor(UserManagementNotifier)
final userManagementProvider = UserManagementNotifierProvider._();

final class UserManagementNotifierProvider
    extends
        $AsyncNotifierProvider<
          UserManagementNotifier,
          List<ManagedUserEntity>
        > {
  UserManagementNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userManagementProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userManagementNotifierHash();

  @$internal
  @override
  UserManagementNotifier create() => UserManagementNotifier();
}

String _$userManagementNotifierHash() =>
    r'5c7d1c830562dc1088fc88759e87d6f05479620a';

abstract class _$UserManagementNotifier
    extends $AsyncNotifier<List<ManagedUserEntity>> {
  FutureOr<List<ManagedUserEntity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ManagedUserEntity>>,
              List<ManagedUserEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ManagedUserEntity>>,
                List<ManagedUserEntity>
              >,
              AsyncValue<List<ManagedUserEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
