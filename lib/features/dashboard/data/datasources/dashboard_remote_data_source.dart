/// Sumber data dashboard.
///
/// Fase 1 memakai payload JSON statis dengan `Future.delayed` untuk mensimulasikan
/// network call. Fase 2 cukup mengganti isi implementasi dengan `Dio.get(...)`
/// tanpa mengubah layer repository/domain/presentation.
abstract interface class IDashboardRemoteDataSource {
  Future<Map<String, dynamic>> fetchDashboard();
}

class DashboardRemoteDataSource implements IDashboardRemoteDataSource {
  const DashboardRemoteDataSource({
    this.latency = const Duration(milliseconds: 450),
  });

  /// Latensi buatan supaya state loading/refresh di UI bisa diuji.
  final Duration latency;

  @override
  Future<Map<String, dynamic>> fetchDashboard() async {
    await Future<void>.delayed(latency);
    return _buildDashboardPayload();
  }
}

Map<String, dynamic> _buildDashboardPayload() {
  final now = DateTime.now();
  String at(Duration ago) => now.subtract(ago).toUtc().toIso8601String();

  return <String, dynamic>{
    'projects': <Map<String, dynamic>>[
      {
        'id': 'PRJ-001',
        'name': 'E-Commerce App',
        'client': 'PT. ABC Retail',
        'status': 'In Progress',
        'current_stage': 4,
        'current_stage_title': 'Development',
        'document_count': 7,
        'due_date': '2026-11-20',
      },
      {
        'id': 'PRJ-002',
        'name': 'Mobile Banking Revamp',
        'client': 'Bank Nusantara',
        'status': 'In Progress',
        'current_stage': 6,
        'current_stage_title': 'UAT',
        'document_count': 11,
        'due_date': '2026-11-05',
      },
      {
        'id': 'PRJ-003',
        'name': 'HRIS Internal Portal',
        'client': 'PT. Sinar Jaya',
        'status': 'On Hold',
        'current_stage': 3,
        'current_stage_title': 'UI/UX Design',
        'document_count': 5,
        'due_date': '2026-12-15',
      },
      {
        'id': 'PRJ-004',
        'name': 'Company Profile Website',
        'client': 'CV. Kreatif Media',
        'status': 'Completed',
        'current_stage': 8,
        'current_stage_title': 'Maintenance',
        'document_count': 16,
        'due_date': '2026-09-30',
      },
      {
        'id': 'PRJ-005',
        'name': 'Logistics Dashboard',
        'client': 'PT. Kirim Cepat',
        'status': 'In Progress',
        'current_stage': 2,
        'current_stage_title': 'Requirement',
        'document_count': 3,
        'due_date': '2027-01-10',
      },
      {
        'id': 'PRJ-006',
        'name': 'POS Integration',
        'client': 'Toko Sejahtera',
        'status': 'Not Started',
        'current_stage': 0,
        'current_stage_title': 'Discovery & Brief',
        'document_count': 0,
        'due_date': '2027-02-01',
      },
      {
        'id': 'PRJ-007',
        'name': 'Healthcare Booking System',
        'client': 'Klinik Sehat',
        'status': 'In Progress',
        'current_stage': 5,
        'current_stage_title': 'QA & Testing',
        'document_count': 9,
        'due_date': '2026-11-28',
      },
      {
        'id': 'PRJ-008',
        'name': 'ERP Customization',
        'client': 'PT. Maju Bersama',
        'status': 'Completed',
        'current_stage': 8,
        'current_stage_title': 'Maintenance',
        'document_count': 16,
        'due_date': '2026-08-18',
      },
    ],
    'activities': <Map<String, dynamic>>[
      {
        'id': 'ACT-001',
        'actor': 'Rina',
        'division': 'PM',
        'action': 'membuat proyek baru',
        'target': 'POS Integration',
        'project_name': 'POS Integration',
        'occurred_at': at(const Duration(minutes: 45)),
      },
      {
        'id': 'ACT-002',
        'actor': 'Finance',
        'division': 'Finance',
        'action': 'mengunggah',
        'target': 'BAST 1',
        'project_name': 'E-Commerce App',
        'occurred_at': at(const Duration(hours: 2, minutes: 15)),
      },
      {
        'id': 'ACT-003',
        'actor': 'QA',
        'division': 'QA',
        'action': 'mengunggah',
        'target': 'UAT Checklist v2',
        'project_name': 'Mobile Banking Revamp',
        'occurred_at': at(const Duration(hours: 4)),
      },
      {
        'id': 'ACT-004',
        'actor': 'Budi',
        'division': 'Developer',
        'action': 'menyelesaikan tahap',
        'target': 'QA & Testing',
        'project_name': 'Logistics Dashboard',
        'occurred_at': at(const Duration(days: 1, hours: 2)),
      },
      {
        'id': 'ACT-005',
        'actor': 'Finance',
        'division': 'Finance',
        'action': 'mengunggah',
        'target': 'Invoice #INV-2291',
        'project_name': 'HRIS Internal Portal',
        'occurred_at': at(const Duration(days: 2, hours: 3)),
      },
      {
        'id': 'ACT-006',
        'actor': 'Sari',
        'division': 'PM',
        'action': 'memperbarui status',
        'target': 'Company Profile Website menjadi Completed',
        'project_name': 'Company Profile Website',
        'occurred_at': at(const Duration(days: 3)),
      },
    ],
  };
}
