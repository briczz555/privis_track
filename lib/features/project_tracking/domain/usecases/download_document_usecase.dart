import 'dart:typed_data';

import '../repositories/project_tracking_repository.dart';

class DownloadDocumentUsecase {
  const DownloadDocumentUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<Uint8List> call(String documentId) =>
      _repository.downloadDocument(documentId);
}
