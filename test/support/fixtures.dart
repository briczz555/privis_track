import 'package:privis_track/core/constants/project_status.dart';
import 'package:privis_track/features/auth/domain/entities/auth_role.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/entities/auth_user_entity.dart';
import 'package:privis_track/features/audit_log/domain/entities/audit_log_entity.dart';
import 'package:privis_track/features/audit_log/domain/entities/audit_log_page_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/activity_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/portfolio_slice_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/project_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/project_list_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/client_info_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/project_stage_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/project_tracking_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_type.dart';
import 'package:privis_track/features/user_management/domain/entities/managed_user_entity.dart';

final testUser = AuthUserEntity(
  id: 'user-1',
  name: 'Admin PriVis',
  email: 'admin@privis.id',
  role: AuthRole.admin,
  division: 'Management',
);

final testSession = AuthSessionEntity(
  accessToken: 'test-access-token',
  refreshToken: 'test-refresh-token',
  expiresAt: DateTime.utc(2030, 1, 1),
  user: testUser,
);

ProjectEntity _project({
  required String code,
  required String name,
  required String client,
  required ProjectStatus status,
  required int currentStage,
  required int completedStages,
  required int progressPercent,
  String currentStageTitle = 'Development',
}) {
  return ProjectEntity(
    id: 'id-$code',
    code: code,
    name: name,
    client: client,
    status: status,
    currentStage: currentStage,
    currentStageTitle: currentStageTitle,
    completedStages: completedStages,
    progressPercent: progressPercent,
    documentCount: 7,
    dueDate: DateTime(2026, 11, 20),
    updatedAt: DateTime.utc(2026, 11, 10),
  );
}

final testProjects = [
  _project(
    code: 'PRJ-001',
    name: 'E-Commerce App',
    client: 'PT. ABC Retail',
    status: ProjectStatus.inProgress,
    currentStage: 4,
    completedStages: 3,
    progressPercent: 38,
  ),
  _project(
    code: 'PRJ-003',
    name: 'HRIS Internal Portal',
    client: 'PT. Sinar Jaya',
    status: ProjectStatus.onHold,
    currentStage: 3,
    completedStages: 2,
    progressPercent: 25,
    currentStageTitle: 'UI/UX Design',
  ),
  _project(
    code: 'PRJ-004',
    name: 'Company Profile Website',
    client: 'CV. Kreatif Media',
    status: ProjectStatus.completed,
    currentStage: 8,
    completedStages: 8,
    progressPercent: 100,
    currentStageTitle: 'Maintenance',
  ),
];

final testActivities = [
  ActivityEntity(
    id: 'act-1',
    type: 'document_uploaded',
    actor: 'Finance',
    division: 'Finance',
    action: 'mengunggah',
    target: 'BAST 1',
    projectCode: 'PRJ-001',
    projectName: 'E-Commerce App',
    occurredAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  ActivityEntity(
    id: 'act-2',
    type: 'stage_completed',
    actor: 'Rina',
    division: 'PM',
    action: 'menyelesaikan tahap',
    target: 'Requirement',
    projectCode: 'PRJ-001',
    projectName: 'E-Commerce App',
    occurredAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
];

final testDashboard = DashboardEntity(
  generatedAt: DateTime.utc(2026, 11, 11),
  totalProjects: 3,
  portfolio: const [
    PortfolioSliceEntity(
      status: ProjectStatus.inProgress,
      count: 1,
      percentage: 33.3,
    ),
    PortfolioSliceEntity(
      status: ProjectStatus.onHold,
      count: 1,
      percentage: 33.3,
    ),
    PortfolioSliceEntity(
      status: ProjectStatus.completed,
      count: 1,
      percentage: 33.4,
    ),
  ],
  activeProjects: [testProjects.first],
  activities: testActivities,
);

final testProjectList = ProjectListEntity(
  projects: testProjects,
  page: 1,
  limit: 100,
  total: testProjects.length,
  totalPages: 1,
  statusCounts: const {
    ProjectStatus.inProgress: 1,
    ProjectStatus.onHold: 1,
    ProjectStatus.notStarted: 0,
    ProjectStatus.completed: 1,
  },
);

final testAuditLogs = [
  AuditLogEntity(
    id: 'audit-1',
    actorName: 'Admin PriVis',
    actorRole: AuthRole.admin,
    action: 'user.created',
    entity: 'user',
    entityId: 'user-9',
    summary: 'membuat user Budi Baru (budi@privis.id)',
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  AuditLogEntity(
    id: 'audit-2',
    actorName: 'Admin PriVis',
    actorRole: AuthRole.admin,
    action: 'project.updated',
    entity: 'project',
    entityId: 'project-1',
    summary: 'memperbarui proyek PRJ-001 · E-Commerce App',
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
  ),
];

final testAuditLogPage = AuditLogPageEntity(
  logs: testAuditLogs,
  page: 1,
  limit: 30,
  total: testAuditLogs.length,
  totalPages: 1,
);

final testManagedUsers = [
  ManagedUserEntity(
    id: 'user-1',
    name: 'Admin PriVis',
    email: 'admin@privis.id',
    role: AuthRole.admin,
    division: 'Management',
    isActive: true,
    createdAt: DateTime.utc(2025, 1, 1),
  ),
  ManagedUserEntity(
    id: 'user-2',
    name: 'Rina PM',
    email: 'rina@privis.id',
    role: AuthRole.pm,
    division: 'PM',
    isActive: true,
    createdAt: DateTime.utc(2025, 2, 1),
  ),
  ManagedUserEntity(
    id: 'user-3',
    name: 'Budi Dev',
    email: 'budi@privis.id',
    role: AuthRole.developer,
    division: 'Engineering',
    isActive: false,
    createdAt: DateTime.utc(2025, 3, 1),
  ),
];

final testTracking = ProjectTrackingEntity(
  id: 'id-PRJ-001',
  code: 'PRJ-001',
  name: 'E-Commerce App',
  client: const ClientInfoEntity(
    name: 'PT. ABC Retail',
    address: 'Jl. Jenderal Sudirman Kav. 52-53, Jakarta Selatan 12190',
    contactName: 'Dewi Lestari',
    contactRole: 'IT Manager',
    phone: '+62 812-3456-7890',
  ),
  status: ProjectStatus.inProgress,
  currentStage: 4,
  completedStages: 3,
  progressPercent: 38,
  stages: [
    ProjectStageEntity(
      id: 1,
      title: 'Discovery & Brief',
      isCompleted: true,
      completedAt: DateTime.utc(2026, 10, 20),
      documents: [
        StageDocumentEntity(
          id: 'doc-1',
          name: 'MoM Kickoff.pdf',
          type: StageDocumentType.pdf,
          uploadedBy: 'Rina',
          uploadedAt: DateTime.utc(2026, 10, 19),
        ),
        StageDocumentEntity(
          id: 'doc-2',
          name: 'Project Brief.pdf',
          type: StageDocumentType.pdf,
          uploadedBy: 'Finance',
          uploadedAt: DateTime.utc(2026, 10, 19),
        ),
      ],
    ),
    ProjectStageEntity(
      id: 2,
      title: 'Requirement',
      isCompleted: true,
      completedAt: DateTime.utc(2026, 10, 29),
      documents: [
        StageDocumentEntity(
          id: 'doc-4',
          name: 'SRS Document.pdf',
          type: StageDocumentType.pdf,
          uploadedBy: 'Rina',
          uploadedAt: DateTime.utc(2026, 10, 28),
        ),
        StageDocumentEntity(
          id: 'doc-5',
          name: 'User Story Backlog.xlsx',
          type: StageDocumentType.spreadsheet,
          uploadedBy: 'QA',
          uploadedAt: DateTime.utc(2026, 10, 28),
        ),
      ],
    ),
    ProjectStageEntity(
      id: 3,
      title: 'UI/UX Design',
      isCompleted: true,
      completedAt: DateTime.utc(2026, 11, 7),
      documents: [
        StageDocumentEntity(
          id: 'doc-6',
          name: 'Wireframe.fig',
          type: StageDocumentType.design,
          uploadedBy: 'Budi',
          uploadedAt: DateTime.utc(2026, 11, 6),
        ),
        StageDocumentEntity(
          id: 'doc-7',
          name: 'Design System.pdf',
          type: StageDocumentType.pdf,
          uploadedBy: 'Budi',
          uploadedAt: DateTime.utc(2026, 11, 6),
        ),
      ],
    ),
    ProjectStageEntity(
      id: 4,
      title: 'Development',
      isCompleted: false,
      documents: [
        StageDocumentEntity(
          id: 'doc-3',
          name: 'Technical Spec.pdf',
          type: StageDocumentType.pdf,
          uploadedBy: 'Budi',
          uploadedAt: DateTime.utc(2026, 11, 9),
        ),
      ],
    ),
    const ProjectStageEntity(id: 5, title: 'QA & Testing', isCompleted: false),
    const ProjectStageEntity(id: 6, title: 'UAT', isCompleted: false),
    const ProjectStageEntity(id: 7, title: 'Deployment', isCompleted: false),
    const ProjectStageEntity(id: 8, title: 'Maintenance', isCompleted: false),
  ],
  updatedAt: DateTime.utc(2026, 11, 10),
);
