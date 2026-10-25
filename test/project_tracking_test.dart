import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/theme/app_theme.dart';
import 'package:privis_track/features/project_tracking/data/datasources/project_tracking_remote_data_source.dart';
import 'package:privis_track/features/project_tracking/data/repositories/project_tracking_repository_impl.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_type.dart';
import 'package:privis_track/features/project_tracking/presentation/screens/project_tracking_screen.dart';

Widget _wrap(Widget child) {
  return ProviderScope(
    child: MaterialApp(theme: AppTheme.light, home: child),
  );
}

void main() {
  group('ProjectTrackingRepository', () {
    final repository = ProjectTrackingRepositoryImpl(
      const ProjectTrackingRemoteDataSource(
        latency: Duration.zero,
        uploadLatency: Duration.zero,
      ),
    );

    test('memetakan detail proyek dan 8 tahap SDLC', () async {
      final project = await repository.getProject('PRJ-001');

      expect(project.name, 'E-Commerce App');
      expect(project.client, 'PT. ABC Retail');
      expect(project.stages, hasLength(8));
      expect(project.totalDocuments, 7);

      final discovery = project.stageById(1)!;
      expect(discovery.title, 'Discovery & Brief');
      expect(discovery.isCompleted, isTrue);
      expect(discovery.completedAt, isNotNull);
      expect(discovery.documents.first.name, 'MoM Kickoff.pdf');
      expect(discovery.documents.first.type, StageDocumentType.pdf);

      final development = project.stageById(4)!;
      expect(development.title, 'Development');
      expect(development.isCompleted, isFalse);
      expect(project.isCurrentStage(development), isTrue);
      expect(development.documentCount, 1);

      final maintenance = project.stageById(8)!;
      expect(maintenance.documents, isEmpty);
    });

    test('proyek belum mulai tidak punya dokumen sama sekali', () async {
      final project = await repository.getProject('PRJ-006');

      expect(project.currentStage, 0);
      expect(project.progressPercent, 0);
      expect(project.totalDocuments, 0);
      expect(
        project.stages.every((stage) => stage.isCompleted == false),
        isTrue,
      );
    });

    test(
      'mock upload mengembalikan dokumen bertipe sesuai nama file',
      () async {
        final document = await repository.uploadDocument(
          projectId: 'PRJ-001',
          stageId: 1,
          fileName: 'Lampiran 3.pdf',
        );

        expect(document.name, 'Lampiran 3.pdf');
        expect(document.type, StageDocumentType.pdf);
        expect(document.uploadedBy, 'Anda');
        expect(document.url, contains('dummy.link'));
      },
    );
  });

  group('ProjectTrackingScreen', () {
    Future<void> pumpScreen(
      WidgetTester tester, {
      String projectId = 'PRJ-001',
    }) async {
      // Viewport tinggi supaya seluruh 8 tahap terlihat tanpa scroll.
      tester.view.physicalSize = const Size(420, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _wrap(ProjectTrackingScreen(projectId: projectId)),
      );
      await tester.pumpAndSettle();
    }

    testWidgets('menampilkan ringkasan proyek dan 8 tahap timeline', (
      tester,
    ) async {
      await pumpScreen(tester);

      expect(find.text('Project Tracking'), findsOneWidget);
      expect(find.text('E-Commerce App'), findsOneWidget);
      expect(find.text('Timeline SDLC'), findsOneWidget);

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

    testWidgets('tahap yang belum berjalan tetap bisa dibuka (no step-lock)', (
      tester,
    ) async {
      await pumpScreen(tester);

      await tester.tap(find.text('UAT'));
      await tester.pumpAndSettle();

      expect(find.text('DOCUMENT VAULT'), findsOneWidget);
      expect(find.textContaining('Belum ada dokumen'), findsOneWidget);
    });

    testWidgets('mock upload menambah dokumen ke document vault', (
      tester,
    ) async {
      await pumpScreen(tester);

      await tester.tap(find.text('Discovery & Brief'));
      await tester.pumpAndSettle();

      expect(find.text('DOCUMENT VAULT'), findsOneWidget);
      expect(find.text('MoM Kickoff.pdf'), findsOneWidget);
      expect(find.text('2 file'), findsOneWidget);

      await tester.tap(find.text('Unggah dokumen (mock)'));
      await tester.pumpAndSettle();

      expect(find.text('Lampiran 3.pdf'), findsOneWidget);
      expect(find.text('3 file'), findsOneWidget);
    });
  });
}
