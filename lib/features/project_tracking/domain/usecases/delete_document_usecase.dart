import '../repositories/project_tracking_repository.dart';

class DeleteDocumentUsecase {
  const DeleteDocumentUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<void> call(String documentId) =>
      _repository.deleteDocument(documentId);
}
