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
    required this.address,
    required this.contactName,
    required this.contactRole,
    required this.phone,
    required this.status,
    required this.currentStage,
  });

  final String name;
  final String client;
  final String address;
  final String contactName;
  final String contactRole;
  final String phone;
  final String status;
  final int currentStage;

  Map<String, dynamic> get clientJson => <String, dynamic>{
    'name': client,
    'address': address,
    'contact_name': contactName,
    'contact_role': contactRole,
    'phone': phone,
  };
}

/// Metadata ringkas per proyek — diselaraskan dengan dummy `dashboard`.
const _projectMeta = <String, _ProjectMeta>{
  'PRJ-001': _ProjectMeta(
    name: 'E-Commerce App',
    client: 'PT. ABC Retail',
    address: 'Jl. Jenderal Sudirman Kav. 52-53, Jakarta Selatan 12190',
    contactName: 'Dewi Lestari',
    contactRole: 'IT Manager',
    phone: '+62 812-3456-7890',
    status: 'In Progress',
    currentStage: 4,
  ),
  'PRJ-002': _ProjectMeta(
    name: 'Mobile Banking Revamp',
    client: 'Bank Nusantara',
    address: 'Menara Nusantara, Jl. MH Thamrin No. 5, Jakarta Pusat 10340',
    contactName: 'Andi Pratama',
    contactRole: 'Digital Product Lead',
    phone: '+62 811-2233-4455',
    status: 'In Progress',
    currentStage: 6,
  ),
  'PRJ-003': _ProjectMeta(
    name: 'HRIS Internal Portal',
    client: 'PT. Sinar Jaya',
    address: 'Gedung Sinar Jaya Lt. 8, Jl. Gatot Subroto No. 21, Jakarta 12930',
    contactName: 'Maya Kusuma',
    contactRole: 'HR Director',
    phone: '+62 813-9988-7766',
    status: 'On Hold',
    currentStage: 3,
  ),
  'PRJ-004': _ProjectMeta(
    name: 'Company Profile Website',
    client: 'CV. Kreatif Media',
    address: 'Jl. Kemang Raya No. 12, Jakarta Selatan 12730',
    contactName: 'Rendi Saputra',
    contactRole: 'Founder',
    phone: '+62 812-7788-9900',
    status: 'Completed',
    currentStage: 8,
  ),
  'PRJ-005': _ProjectMeta(
    name: 'Logistics Dashboard',
    client: 'PT. Kirim Cepat',
    address: 'Jl. Raya Bekasi Timur KM 18, Jakarta Timur 13910',
    contactName: 'Siti Rahma',
    contactRole: 'Operations Manager',
    phone: '+62 815-4455-6677',
    status: 'In Progress',
    currentStage: 2,
  ),
  'PRJ-006': _ProjectMeta(
    name: 'POS Integration',
    client: 'Toko Sejahtera',
    address: 'Jl. Pahlawan No. 45, Bandung 40123',
    contactName: 'Agus Wijaya',
    contactRole: 'Owner',
    phone: '+62 812-1010-2020',
    status: 'Not Started',
    currentStage: 0,
  ),
  'PRJ-007': _ProjectMeta(
    name: 'Healthcare Booking System',
    client: 'Klinik Sehat',
    address: 'Jl. Diponegoro No. 88, Surabaya 60241',
    contactName: 'dr. Nadia Putri',
    contactRole: 'Klinik Director',
    phone: '+62 811-3030-4040',
    status: 'In Progress',
    currentStage: 5,
  ),
  'PRJ-008': _ProjectMeta(
    name: 'ERP Customization',
    client: 'PT. Maju Bersama',
    address: 'Gedung Maju Tower Lt. 12, Jl. TB Simatupang No. 9, Jakarta 12430',
    contactName: 'Hendra Gunawan',
    contactRole: 'Finance Director',
    phone: '+62 813-5566-7788',
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
        address: 'Alamat belum tersedia',
        contactName: 'Belum ada PIC',
        contactRole: '-',
        phone: '-',
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
    'client': meta.clientJson,
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
