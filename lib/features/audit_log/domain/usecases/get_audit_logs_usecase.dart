import '../entities/audit_log_page_entity.dart';
import '../repositories/audit_log_repository.dart';

class GetAuditLogsUsecase {
  const GetAuditLogsUsecase(this._repository);

  final AuditLogRepository _repository;

  Future<AuditLogPageEntity> call({int page = 1, int limit = 30}) =>
      _repository.getAuditLogs(page: page, limit: limit);
}
