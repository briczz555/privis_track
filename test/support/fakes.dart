import 'dart:typed_data';

import 'package:privis_track/core/constants/project_status.dart';
import 'package:privis_track/core/network/exceptions/network_exception.dart';
import 'package:privis_track/core/storage/cache_store.dart';
import 'package:privis_track/features/auth/domain/entities/auth_role.dart';
import 'package:privis_track/features/auth/domain/entities/auth_session_entity.dart';
import 'package:privis_track/features/auth/domain/repositories/auth_repository.dart';
import 'package:privis_track/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:privis_track/features/dashboard/domain/entities/project_list_entity.dart';
import 'package:privis_track/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:privis_track/features/project_tracking/domain/entities/project_tracking_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_entity.dart';
import 'package:privis_track/features/project_tracking/domain/entities/stage_document_type.dart';
import 'package:privis_track/features/project_tracking/domain/repositories/project_tracking_repository.dart';
import 'package:privis_track/features/user_management/domain/entities/managed_user_entity.dart';
import 'package:privis_track/features/user_management/domain/repositories/user_management_repository.dart';

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
  Future<AuthSessionEntity> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    session ??= testSession;
    return session!;
  }

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
  Future<void> deleteDocument(String documentId) async {}

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

class FakeUserManagementRepository implements UserManagementRepository {
  FakeUserManagementRepository(List<ManagedUserEntity> users)
    : users = List.of(users);

  final List<ManagedUserEntity> users;
  int createCalls = 0;
  int updateCalls = 0;
  int resetCalls = 0;

  @override
  Future<List<ManagedUserEntity>> getUsers() async => List.unmodifiable(users);

  @override
  Future<ManagedUserEntity> createUser({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  }) async {
    createCalls += 1;
    final trimmedDivision = division?.trim();
    final user = ManagedUserEntity(
      id: 'user-new-$createCalls',
      name: name,
      email: email,
      role: role,
      division: (trimmedDivision == null || trimmedDivision.isEmpty)
          ? null
          : trimmedDivision,
      isActive: true,
      createdAt: DateTime.utc(2026, 11, 12),
    );
    users.add(user);
    return user;
  }

  @override
  Future<ManagedUserEntity> updateUser({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  }) async {
    updateCalls += 1;
    final index = users.indexWhere((user) => user.id == id);
    final updated = users[index].copyWith(
      name: name,
      role: role,
      division: division,
      isActive: isActive,
    );
    users[index] = updated;
    return updated;
  }

  @override
  Future<void> resetPassword({
    required String id,
    required String newPassword,
  }) async {
    resetCalls += 1;
  }
}

class MemorySnapshotCache implements SnapshotCache {
  final Map<String, CachedSnapshot> snapshots = {};
  int writeCalls = 0;
  int clearCalls = 0;

  @override
  Future<CachedSnapshot?> read(String key) async => snapshots[key];

  @override
  Future<void> write({
    required String key,
    required String payload,
    DateTime? updatedAt,
  }) async {
    writeCalls += 1;
    snapshots[key] = CachedSnapshot(
      payload: payload,
      updatedAt: updatedAt ?? DateTime.utc(2026, 11, 12, 8),
    );
  }

  @override
  Future<void> clear() async {
    clearCalls += 1;
    snapshots.clear();
  }
}
