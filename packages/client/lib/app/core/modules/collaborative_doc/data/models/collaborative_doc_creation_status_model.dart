import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocCreationStatusModel
    extends CollaborativeDocCreationStatusEntity {
  const CollaborativeDocCreationStatusModel({required super.isCreated});

  static CollaborativeDocCreationStatusModel fromSupabase(List sbQueryRes) {
    return const CollaborativeDocCreationStatusModel(isCreated: true);
  }
}
