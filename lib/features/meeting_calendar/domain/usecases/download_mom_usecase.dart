import 'dart:typed_data';

import '../repositories/meeting_repository.dart';

class DownloadMomUsecase {
  const DownloadMomUsecase(this._repository);

  final MeetingRepository _repository;

  Future<Uint8List> call(String id) => _repository.downloadMom(id);
}
