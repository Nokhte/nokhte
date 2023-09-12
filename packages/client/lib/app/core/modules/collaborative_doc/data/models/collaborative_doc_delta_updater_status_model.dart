import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocDeltaUpdaterStatusModel
    extends CollaborativeDocDeltaUpdaterStatusEntity {
  const CollaborativeDocDeltaUpdaterStatusModel({required super.isUpdated});

  static CollaborativeDocDeltaUpdaterStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const CollaborativeDocDeltaUpdaterStatusModel(isUpdated: false);
    } else {
      return const CollaborativeDocDeltaUpdaterStatusModel(isUpdated: true);
    }
  }
}
