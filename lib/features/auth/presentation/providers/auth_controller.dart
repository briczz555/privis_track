// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/auth/auth_session_cache.dart';
import '../../../../core/network/auth_dio_provider.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/refresh_session_usecase.dart';
import '../../domain/usecases/restore_session_usecase.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
IAuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(ref.watch(authDioProvider));
}

@Riverpod(keepAlive: true)
IAuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSource();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
LoginUsecase loginUsecase(Ref ref) =>
    LoginUsecase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
RefreshSessionUsecase refreshSessionUsecase(Ref ref) =>
    RefreshSessionUsecase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
RestoreSessionUsecase restoreSessionUsecase(Ref ref) =>
    RestoreSessionUsecase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
LogoutUsecase logoutUsecase(Ref ref) =>
    LogoutUsecase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  Future<AuthSessionEntity?>? _refreshFuture;
  int _epoch = 0;

  @override
  Future<AuthSessionEntity?> build() async {
    var session = await ref.read(restoreSessionUsecaseProvider).call();

    // Refresh proaktif jika access token hampir kedaluwarsa.
    if (session != null &&
        session.expiresAt.isBefore(
          DateTime.now().add(const Duration(seconds: 30)),
        )) {
      try {
        session = await ref
            .read(refreshSessionUsecaseProvider)
            .call(session.refreshToken);
      } on UnauthorizedException {
        await ref.read(logoutUsecaseProvider).call();
        session = null;
      } on NetworkException {
        // Offline/timeout: pertahankan sesi; interceptor akan mencoba refresh
        // saat request berikutnya.
      } catch (_) {
        session = null;
      }
    }

    _syncCache(session);
    return session;
  }

  Future<void> login({required String email, required String password}) async {
    _epoch += 1;
    state = const AsyncLoading();

    final result = await AsyncValue.guard(
      () =>
          ref.read(loginUsecaseProvider).call(email: email, password: password),
    );

    if (!ref.mounted) return;

    final session = result.value;
    if (session != null) _syncCache(session);
    state = result;
  }

  Future<AuthSessionEntity?> refreshSession() {
    return _refreshFuture ??= _performRefresh().whenComplete(() {
      _refreshFuture = null;
    });
  }

  Future<void> logout() async {
    _epoch += 1;
    _refreshFuture = null;

    // Redirect ke login segera; revoke token ke server berjalan best-effort.
    _clearSessionState();
    await ref.read(authRepositoryProvider).logout();
  }

  Future<AuthSessionEntity?> _performRefresh() async {
    final startEpoch = _epoch;
    final refreshToken =
        ref.read(authSessionCacheProvider).refreshToken ??
        state.value?.refreshToken;

    if (refreshToken == null) return null;

    try {
      final session = await ref
          .read(refreshSessionUsecaseProvider)
          .call(refreshToken);

      if (!ref.mounted || startEpoch != _epoch) return null;

      _syncCache(session);
      state = AsyncData(session);
      return session;
    } on UnauthorizedException {
      if (startEpoch == _epoch) {
        await ref.read(logoutUsecaseProvider).call();
        _clearSessionState();
      }
      return null;
    } on ForbiddenException {
      if (startEpoch == _epoch) {
        await ref.read(logoutUsecaseProvider).call();
        _clearSessionState();
      }
      return null;
    } on NetworkException {
      // Gangguan jaringan bukan alasan menghapus sesi.
      return null;
    } catch (_) {
      return null;
    }
  }

  void _syncCache(AuthSessionEntity? session) {
    final cache = ref.read(authSessionCacheProvider);

    if (session == null) {
      cache.clear();
      return;
    }

    cache.update(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
      expiresAt: session.expiresAt,
      refresh: () async {
        final current = await refreshSession();
        return current?.accessToken;
      },
    );
  }

  void _clearSessionState() {
    ref.read(authSessionCacheProvider).clear();
    if (ref.mounted) state = const AsyncData(null);
  }
}
