import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_account_remote_data_source.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../dto/auth_tokens_dto.dart';
import '../models/auth_session_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._account, this._local);

  final IAuthRemoteDataSource _remote;
  final IAuthAccountRemoteDataSource _account;
  final IAuthLocalDataSource _local;

  @override
  Future<AuthSessionEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final payload = await _remote.login(email: email, password: password);
      return await _persist(AuthTokensDto.fromJson(payload));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<AuthSessionEntity> refresh(String refreshToken) async {
    try {
      final payload = await _remote.refresh(refreshToken);
      return await _persist(AuthTokensDto.fromJson(payload));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<AuthSessionEntity?> restoreSession() async {
    final raw = await _local.readSession();
    if (raw == null || raw.isEmpty) return null;

    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return AuthSessionModel.fromJson(json).toEntity();
    } catch (_) {
      await _local.clearSession();
      return null;
    }
  }

  @override
  Future<AuthSessionEntity> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final payload = await _account.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return await _persist(AuthTokensDto.fromJson(payload));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<void> logout() async {
    final current = await restoreSession();

    // Hapus sesi lokal lebih dulu; revoke ke server bersifat best effort.
    await _local.clearSession();

    if (current != null) {
      try {
        await _remote.logout(current.refreshToken);
      } on DioException {
        // Server tidak terjangkau / token sudah dicabut: abaikan.
      }
    }
  }

  Future<AuthSessionEntity> _persist(AuthTokensDto dto) async {
    final model = AuthSessionModel.fromDto(dto);
    await _local.writeSession(jsonEncode(model.toJson()));
    return model.toEntity();
  }
}
