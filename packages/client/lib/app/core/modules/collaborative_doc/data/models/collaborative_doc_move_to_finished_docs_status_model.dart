import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocMoveToFinishedDocsStatusModel
    extends CollaborativeDocMoveToFinishedDocsStatusEntity {
  const CollaborativeDocMoveToFinishedDocsStatusModel({required super.isMoved});

  static CollaborativeDocMoveToFinishedDocsStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const CollaborativeDocMoveToFinishedDocsStatusModel(
          isMoved: false);
    } else {
      return const CollaborativeDocMoveToFinishedDocsStatusModel(isMoved: true);
    }
  }
}
