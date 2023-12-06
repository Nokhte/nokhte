import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocPresenceUpdaterStatusModel
    extends CollaborativeDocPresenceUpdaterStatusEntity {
  const CollaborativeDocPresenceUpdaterStatusModel({required super.isUpdated});

  static CollaborativeDocPresenceUpdaterStatusModel fromSupabase(
      List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const CollaborativeDocPresenceUpdaterStatusModel(isUpdated: false);
    } else {
      return const CollaborativeDocPresenceUpdaterStatusModel(isUpdated: true);
    }
  }
}
