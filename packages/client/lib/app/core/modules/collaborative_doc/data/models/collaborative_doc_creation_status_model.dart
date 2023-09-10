import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocCreationStatusModel
    extends CollaborativeDocCreationStatusEntity {
  const CollaborativeDocCreationStatusModel({required super.isCreated});

  static CollaborativeDocCreationStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const CollaborativeDocCreationStatusModel(isCreated: false);
    } else {
      return const CollaborativeDocCreationStatusModel(isCreated: true);
    }
  }
}
