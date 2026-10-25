import '../../../../core/constants/sdlc_stages.dart';

/// Sumber data detail proyek untuk timeline SDLC + document vault.
///
/// Fase 1 memakai payload JSON statis dengan `Future.delayed` untuk
/// mensimulasikan network call. Fase 2 cukup mengganti isi implementasi dengan
/// `Dio.get(...)` / `Dio.post(...)` tanpa mengubah repository, domain, maupun UI.
abstract interface class IProjectTrackingRemoteDataSource {
  Future<Map<String, dynamic>> fetchProject(String projectId);

  Future<Map<String, dynamic>> uploadDocument({
    required String projectId,
    required int stageId,
    required String fileName,
  });
}

class ProjectTrackingRemoteDataSource
    implements IProjectTrackingRemoteDataSource {
  const ProjectTrackingRemoteDataSource({
    this.latency = const Duration(milliseconds: 450),
    this.uploadLatency = const Duration(milliseconds: 700),
  });

  /// Latensi buatan supaya state loading/upload di UI bisa diuji.
  final Duration latency;
  final Duration uploadLatency;

  @override
  Future<Map<String, dynamic>> fetchProject(String projectId) async {
    await Future<void>.delayed(latency);
    return _buildProjectPayload(projectId);
  }

  @override
  Future<Map<String, dynamic>> uploadDocument({
    required String projectId,
    required int stageId,
    required String fileName,
  }) async {
    // projectId & stageId belum dipakai karena belum ada endpoint nyata; tetap
    // ada di signature supaya Fase 2 tidak perlu mengubah interface.
    await Future<void>.delayed(uploadLatency);
    final now = DateTime.now().toUtc();
    return _documentJson(
      id: 'DOC-${now.microsecondsSinceEpoch}',
      name: fileName,
      uploadedAt: now,
      uploadedBy: 'Anda',
    );
  }
}

class _ProjectMeta {
  const _ProjectMeta({
    required this.name,
    required this.client,
    required this.status,
    required this.currentStage,
  });

  final String name;
  final String client;
  final String status;
  final int currentStage;
}

/// Metadata ringkas per proyek — diselaraskan dengan dummy `dashboard`.
const _projectMeta = <String, _ProjectMeta>{
  'PRJ-001': _ProjectMeta(
    name: 'E-Commerce App',
    client: 'PT. ABC Retail',
    status: 'In Progress',
    currentStage: 4,
  ),
  'PRJ-002': _ProjectMeta(
    name: 'Mobile Banking Revamp',
    client: 'Bank Nusantara',
    status: 'In Progress',
    currentStage: 6,
  ),
  'PRJ-003': _ProjectMeta(
    name: 'HRIS Internal Portal',
    client: 'PT. Sinar Jaya',
    status: 'On Hold',
    currentStage: 3,
  ),
  'PRJ-004': _ProjectMeta(
    name: 'Company Profile Website',
    client: 'CV. Kreatif Media',
    status: 'Completed',
    currentStage: 8,
  ),
  'PRJ-005': _ProjectMeta(
    name: 'Logistics Dashboard',
    client: 'PT. Kirim Cepat',
    status: 'In Progress',
    currentStage: 2,
  ),
  'PRJ-006': _ProjectMeta(
    name: 'POS Integration',
    client: 'Toko Sejahtera',
    status: 'Not Started',
    currentStage: 0,
  ),
  'PRJ-007': _ProjectMeta(
    name: 'Healthcare Booking System',
    client: 'Klinik Sehat',
    status: 'In Progress',
    currentStage: 5,
  ),
  'PRJ-008': _ProjectMeta(
    name: 'ERP Customization',
    client: 'PT. Maju Bersama',
    status: 'Completed',
    currentStage: 8,
  ),
};

/// Nama dokumen contoh per tahap (2 dokumen untuk tahap yang selesai,
/// 1 dokumen untuk tahap yang sedang berjalan).
const _stageDocumentNames = <List<String>>[
  ['MoM Kickoff.pdf', 'Project Brief.pdf'],
  ['SRS Document.pdf', 'User Story Backlog.xlsx'],
  ['Wireframe.fig', 'Design System.pdf'],
  ['Technical Spec.pdf', 'API Contract.pdf'],
  ['Test Plan.pdf', 'Bug Report.xlsx'],
  ['UAT Checklist.pdf', 'BAST 1.pdf'],
  ['Deployment Guide.pdf', 'Release Notes.pdf'],
  ['SLA Agreement.pdf', 'Maintenance Log.pdf'],
];

const _uploaders = <String>['Rina', 'Finance', 'QA', 'Budi'];

Map<String, dynamic> _buildProjectPayload(String projectId) {
  final meta =
      _projectMeta[projectId] ??
      _ProjectMeta(
        name: 'Proyek $projectId',
        client: 'Internal',
        status: 'In Progress',
        currentStage: 1,
      );

  final stageCount = kSdlcStageTitles.length;
  final int completedStages;
  if (meta.status == 'Completed') {
    completedStages = stageCount;
  } else if (meta.status == 'Not Started' || meta.currentStage <= 0) {
    completedStages = 0;
  } else {
    completedStages = meta.currentStage - 1;
  }

  final now = DateTime.now().toUtc();

  return <String, dynamic>{
    'id': projectId,
    'name': meta.name,
    'client': meta.client,
    'status': meta.status,
    'current_stage': meta.currentStage,
    'stages': <Map<String, dynamic>>[
      for (var stageId = 1; stageId <= stageCount; stageId++)
        _stageJson(
          projectId: projectId,
          stageId: stageId,
          completedStages: completedStages,
          currentStage: meta.currentStage,
          status: meta.status,
          now: now,
        ),
    ],
  };
}

Map<String, dynamic> _stageJson({
  required String projectId,
  required int stageId,
  required int completedStages,
  required int currentStage,
  required String status,
  required DateTime now,
}) {
  final isCompleted = stageId <= completedStages;
  final isCurrent =
      !isCompleted &&
      stageId == currentStage &&
      status != 'Not Started' &&
      status != 'Completed';

  final documentNames = <String>[
    if (isCompleted) ..._stageDocumentNames[stageId - 1],
    if (isCurrent) _stageDocumentNames[stageId - 1].first,
  ];

  return <String, dynamic>{
    'id': stageId,
    'title': kSdlcStageTitles[stageId - 1],
    'is_completed': isCompleted,
    'completed_at': isCompleted
        ? now
              .subtract(Duration(days: (completedStages - stageId) * 9 + 3))
              .toIso8601String()
        : null,
    'documents': <Map<String, dynamic>>[
      for (var index = 0; index < documentNames.length; index++)
        _documentJson(
          id: 'DOC-$projectId-$stageId-${index + 1}',
          name: documentNames[index],
          uploadedAt: now.subtract(
            Duration(
              days: isCompleted
                  ? (completedStages - stageId) * 9 + 6 - index
                  : 1 + index,
            ),
          ),
          uploadedBy: _uploaders[(stageId + index) % _uploaders.length],
        ),
    ],
  };
}

Map<String, dynamic> _documentJson({
  required String id,
  required String name,
  required DateTime uploadedAt,
  required String uploadedBy,
}) {
  return <String, dynamic>{
    'id': id,
    'name': name,
    'type': _documentType(name),
    'url': 'https://dummy.link/${Uri.encodeComponent(name)}',
    'uploaded_by': uploadedBy,
    'uploaded_at': uploadedAt.toIso8601String(),
  };
}

String _documentType(String fileName) {
  final extension = fileName.split('.').last.toLowerCase();
  return switch (extension) {
    'pdf' => 'pdf',
    'xlsx' || 'xls' || 'csv' => 'spreadsheet',
    'png' || 'jpg' || 'jpeg' => 'image',
    'fig' || 'sketch' => 'design',
    'doc' || 'docx' => 'document',
    _ => 'other',
  };
}
