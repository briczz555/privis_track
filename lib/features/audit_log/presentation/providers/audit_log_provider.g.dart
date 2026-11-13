// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(auditLogRepository)
final auditLogRepositoryProvider = AuditLogRepositoryProvider._();

final class AuditLogRepositoryProvider
    extends
        $FunctionalProvider<
          AuditLogRepository,
          AuditLogRepository,
          AuditLogRepository
        >
    with $Provider<AuditLogRepository> {
  AuditLogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'auditLogRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuditLogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuditLogRepository create(Ref ref) {
    return auditLogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuditLogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuditLogRepository>(value),
    );
  }
}

String _$auditLogRepositoryHash() =>
    r'6aa4e32b607a262b47007199865ee5cf48e530ab';

@ProviderFor(getAuditLogsUsecase)
final getAuditLogsUsecaseProvider = GetAuditLogsUsecaseProvider._();

final class GetAuditLogsUsecaseProvider
    extends
        $FunctionalProvider<
          GetAuditLogsUsecase,
          GetAuditLogsUsecase,
          GetAuditLogsUsecase
        >
    with $Provider<GetAuditLogsUsecase> {
  GetAuditLogsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAuditLogsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAuditLogsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetAuditLogsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAuditLogsUsecase create(Ref ref) {
    return getAuditLogsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAuditLogsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAuditLogsUsecase>(value),
    );
  }
}

String _$getAuditLogsUsecaseHash() =>
    r'ceab51d15165753553f4311254b1352eaaa86243';

@ProviderFor(AuditLogNotifier)
final auditLogProvider = AuditLogNotifierProvider._();

final class AuditLogNotifierProvider
    extends $AsyncNotifierProvider<AuditLogNotifier, AuditLogPageEntity> {
  AuditLogNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'auditLogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogNotifierHash();

  @$internal
  @override
  AuditLogNotifier create() => AuditLogNotifier();
}

String _$auditLogNotifierHash() => r'ea9418a4d6aa16f33bdca8411be5c40db6f4c247';

abstract class _$AuditLogNotifier extends $AsyncNotifier<AuditLogPageEntity> {
  FutureOr<AuditLogPageEntity> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<AuditLogPageEntity>, AuditLogPageEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuditLogPageEntity>, AuditLogPageEntity>,
              AsyncValue<AuditLogPageEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
