import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/audit_log_page_entity.dart';
import '../../domain/repositories/audit_log_repository.dart';
import '../datasources/audit_log_remote_data_source.dart';
import '../dto/audit_log_dto.dart';
import '../models/audit_log_model.dart';

class AuditLogRepositoryImpl implements AuditLogRepository {
  AuditLogRepositoryImpl(this._remote);

  final IAuditLogRemoteDataSource _remote;

  @override
  Future<AuditLogPageEntity> getAuditLogs({
    int page = 1,
    int limit = 30,
  }) async {
    try {
      final payload = await _remote.fetchAuditLogs(page: page, limit: limit);
      final rawData = payload['data'];

      if (rawData is! List) {
        throw const FormatException('Data audit log tidak valid.');
      }

      final logs = rawData
          .whereType<Map>()
          .map(
            (json) => AuditLogModel.fromDto(
              AuditLogDto.fromJson(Map<String, dynamic>.from(json)),
            ).toEntity(),
          )
          .toList(growable: false);

      final rawMeta = payload['meta'];
      final meta = rawMeta is Map
          ? Map<String, dynamic>.from(rawMeta)
          : const <String, dynamic>{};

      return AuditLogPageEntity(
        logs: logs,
        page: (meta['page'] as num?)?.toInt() ?? page,
        limit: (meta['limit'] as num?)?.toInt() ?? limit,
        total: (meta['total'] as num?)?.toInt() ?? logs.length,
        totalPages: (meta['total_pages'] as num?)?.toInt() ?? 1,
      );
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }
}
