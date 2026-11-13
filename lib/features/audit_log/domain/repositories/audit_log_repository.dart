import '../entities/audit_log_page_entity.dart';

abstract interface class AuditLogRepository {
  Future<AuditLogPageEntity> getAuditLogs({int page = 1, int limit = 30});
}
