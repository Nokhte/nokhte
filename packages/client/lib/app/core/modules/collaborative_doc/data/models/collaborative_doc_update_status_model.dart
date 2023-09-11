import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocUpdateStatusModel
    extends CollaborativeDocUpdateStatusEntity {
  const CollaborativeDocUpdateStatusModel({required super.isUpdated});

  static CollaborativeDocUpdateStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const CollaborativeDocUpdateStatusModel(isUpdated: false);
    } else {
      return const CollaborativeDocUpdateStatusModel(isUpdated: true);
    }
  }
}
