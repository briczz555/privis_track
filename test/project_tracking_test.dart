import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/project_tracking/data/datasources/project_tracking_remote_data_source.dart';
import 'package:privis_track/features/project_tracking/data/repositories/project_tracking_repository_impl.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_type.dart';
import 'package:privis_track/features/project_tracking/presentation/providers/project_tracking_provider.dart';
import 'package:privis_track/features/project_tracking/presentation/screens/project_tracking_screen.dart';

import 'support/fakes.dart';
import 'support/fixtures.dart';

class _FakeProjectDataSource implements IProjectTrackingRemoteDataSource {
  _FakeProjectDataSource(this.payload);

  final Map<String, dynamic> payload;
  String? requestedCode;

  @override
  Future<Map<String, dynamic>> fetchProject(String projectCode) async {
    requestedCode = projectCode;
    return payload;
  }

  @override
  Future<Map<String, dynamic>> uploadDocument({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  }) async => {
    'id': 'uploaded-doc',
    'name': fileName,
    'type': 'pdf',
    'mime_type': 'application/pdf',
    'size_bytes': bytes.length,
    'uploaded_by': {'id': 'u-1', 'name': 'Rina', 'division': 'PM'},
    'uploaded_at': '2026-11-11T00:00:00.000Z',
  };

  @override
  Future<Uint8List> downloadDocument(String documentId) async =>
      Uint8List.fromList([1, 2, 3]);
}

Map<String, dynamic> _projectPayload() => {
  'id': 'project-uuid',
  'code': 'PRJ-001',
  'name': 'E-Commerce App',
  'client': {
    'id': 'client-uuid',
    'name': 'PT. ABC Retail',
    'address': 'Jl. Jenderal Sudirman Kav. 52-53, Jakarta Selatan 12190',
    'contact_name': 'Dewi Lestari',
    'contact_role': 'IT Manager',
    'phone': '+62 812-3456-7890',
  },
  'status': 'in_progress',
  'current_stage': 4,
  'current_stage_title': 'Development',
  'completed_stages': 3,
  'progress_percent': 38,
  'updated_at': '2026-11-10T00:00:00.000Z',
  'stages': [
    for (var stageNo = 1; stageNo <= 8; stageNo++)
      {
        'stage_no': stageNo,
        'title': const [
          'Discovery & Brief',
          'Requirement',
          'UI/UX Design',
          'Development',
          'QA & Testing',
          'UAT',
          'Deployment',
          'Maintenance',
        ][stageNo - 1],
        'is_completed': stageNo <= 3,
        'completed_at': stageNo <= 3
            ? '2026-10-${10 + stageNo}T00:00:00.000Z'
            : null,
        'document_count': stageNo == 1 ? 2 : (stageNo == 4 ? 1 : 0),
        'documents': [
          if (stageNo == 1)
            {
              'id': 'doc-1',
              'name': 'MoM Kickoff.pdf',
              'type': 'pdf',
              'mime_type': 'application/pdf',
              'size_bytes': 245760,
              'uploaded_by': {'id': 'u-1', 'name': 'Rina', 'division': 'PM'},
              'uploaded_at': '2026-10-19T00:00:00.000Z',
            },
          if (stageNo == 1)
            {
              'id': 'doc-2',
              'name': 'Project Brief.pdf',
              'type': 'pdf',
              'mime_type': 'application/pdf',
              'size_bytes': 200000,
              'uploaded_by': {
                'id': 'u-2',
                'name': 'Finance',
                'division': 'Finance',
              },
              'uploaded_at': '2026-10-19T00:00:00.000Z',
            },
          if (stageNo == 4)
            {
              'id': 'doc-3',
              'name': 'Technical Spec.pdf',
              'type': 'pdf',
              'mime_type': 'application/pdf',
              'size_bytes': 180000,
              'uploaded_by': {
                'id': 'u-3',
                'name': 'Budi',
                'division': 'Developer',
              },
              'uploaded_at': '2026-11-09T00:00:00.000Z',
            },
        ],
      },
  ],
};

Widget _app(Widget home) => ProviderScope(
  overrides: [
    projectTrackingRepositoryProvider.overrideWith(
      (ref) => FakeProjectTrackingRepository(testTracking),
    ),
  ],
  child: MaterialApp(theme: AppTheme.light, home: home),
);

void main() {
  group('ProjectTrackingRepository', () {
    test('memetakan payload API ke entity', () async {
      final remote = _FakeProjectDataSource(_projectPayload());
      final repository = ProjectTrackingRepositoryImpl(remote);

      final project = await repository.getProject('PRJ-001');

      expect(remote.requestedCode, 'PRJ-001');
      expect(project.code, 'PRJ-001');
      expect(project.stages, hasLength(8));
      expect(project.completedStages, 3);
      expect(project.progressPercent, 38);
      expect(project.currentStage, 4);
      expect(project.totalDocuments, 3);
      expect(project.client.name, 'PT. ABC Retail');
      expect(project.client.phone, '+62 812-3456-7890');
      expect(project.stages.first.documents.first.type, StageDocumentType.pdf);
      expect(project.stages.first.documents.first.uploadedBy, 'Rina');
    });
  });

  group('ProjectTrackingScreen', () {
    Future<void> pumpScreen(WidgetTester tester) async {
      tester.view.physicalSize = const Size(420, 1700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _app(const ProjectTrackingScreen(projectCode: 'PRJ-001')),
      );
      await tester.pumpAndSettle();
    }

    testWidgets('menampilkan ringkasan, kontak, dan 8 tahap', (tester) async {
      await pumpScreen(tester);

      expect(find.text('Project Tracking'), findsOneWidget);
      expect(find.text('E-Commerce App'), findsOneWidget);
      expect(find.text('KONTAK KLIEN'), findsOneWidget);
      expect(find.text('+62 812-3456-7890'), findsOneWidget);

      for (final title in [
        'Discovery & Brief',
        'Requirement',
        'UI/UX Design',
        'Development',
        'QA & Testing',
        'UAT',
        'Deployment',
        'Maintenance',
      ]) {
        expect(find.text(title), findsOneWidget);
      }
    });

    testWidgets('tahap belum berjalan tetap bisa dibuka (no step-lock)', (
      tester,
    ) async {
      await pumpScreen(tester);

      await tester.tap(find.text('UAT'));
      await tester.pumpAndSettle();

      expect(find.text('DOCUMENT VAULT'), findsOneWidget);
      expect(find.text('Unggah dokumen'), findsOneWidget);
      expect(find.textContaining('read-only'), findsNothing);
    });

    testWidgets('document vault menampilkan dokumen tahap', (tester) async {
      await pumpScreen(tester);

      await tester.tap(find.text('Discovery & Brief'));
      await tester.pumpAndSettle();

      expect(find.text('DOCUMENT VAULT'), findsOneWidget);
      expect(find.text('MoM Kickoff.pdf'), findsOneWidget);
      expect(find.text('Project Brief.pdf'), findsOneWidget);
      expect(find.text('2 file'), findsOneWidget);
    });
  });
}
