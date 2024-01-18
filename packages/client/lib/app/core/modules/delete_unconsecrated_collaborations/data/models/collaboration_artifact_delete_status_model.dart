import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class CollaborationArtifactDeleteStatusModel
    extends CollaborationArtifactDeleteStatusEntity {
  const CollaborationArtifactDeleteStatusModel({required super.isDeleted});

  static CollaborationArtifactDeleteStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const CollaborationArtifactDeleteStatusModel(isDeleted: false);
    } else {
      return const CollaborationArtifactDeleteStatusModel(isDeleted: true);
    }
  }
}
