import 'dart:typed_data';

import 'package:privis_track/core/constants/project_status.dart';
import 'package:privis_track/core/network/exceptions/network_exception.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/repositories/auth_repository.dart';
import 'package:privis_track/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/project_list_entity.dart';
import 'package:privis_track/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:privis_track/features/project_tracking/domain/entities/project_tracking_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_type.dart';
import 'package:privis_track/features/project_tracking/domain/repositories/project_tracking_repository.dart';

import 'fixtures.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({
    this.session,
    this.failLogin = false,
    this.loginErrorMessage = 'Email atau password salah.',
  });

  AuthSessionEntity? session;
  bool failLogin;
  final String loginErrorMessage;
  int loginCalls = 0;

  @override
  Future<AuthSessionEntity> login({
    required String email,
    required String password,
  }) async {
    loginCalls += 1;
    if (failLogin) {
      throw UnauthorizedException(loginErrorMessage);
    }
    session ??= testSession;
    return session!;
  }

  @override
  Future<AuthSessionEntity> refresh(String refreshToken) async {
    final current = session;
    if (current == null) throw const UnauthorizedException();
    return current;
  }

  @override
  Future<AuthSessionEntity?> restoreSession() async => session;

  @override
  Future<void> logout() async {
    session = null;
  }
}

class FakeDashboardRepository implements DashboardRepository {
  FakeDashboardRepository({required this.dashboard, required this.projectList});

  final DashboardEntity dashboard;
  final ProjectListEntity projectList;

  @override
  Future<DashboardEntity> getDashboard() async => dashboard;

  @override
  Future<ProjectListEntity> getProjects({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  }) async => projectList;
}

class FakeProjectTrackingRepository implements ProjectTrackingRepository {
  FakeProjectTrackingRepository(this.project);

  final ProjectTrackingEntity project;
  int calls = 0;

  @override
  Future<ProjectTrackingEntity> getProject(String projectCode) async {
    calls += 1;
    return project;
  }

  @override
  Future<StageDocumentEntity> uploadDocument({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  }) async {
    return StageDocumentEntity(
      id: 'uploaded-doc',
      name: fileName,
      type: StageDocumentType.pdf,
      uploadedBy: 'Admin PriVis',
      uploadedAt: DateTime.now(),
    );
  }

  @override
  Future<Uint8List> downloadDocument(String documentId) async {
    return Uint8List.fromList([1, 2, 3]);
  }

  @override
  Future<void> updateStage({
    required String projectCode,
    required int stageId,
    required bool isCompleted,
  }) async {}

  @override
  Future<void> updateProjectStatus({
    required String projectCode,
    required ProjectStatus status,
  }) async {}
}
