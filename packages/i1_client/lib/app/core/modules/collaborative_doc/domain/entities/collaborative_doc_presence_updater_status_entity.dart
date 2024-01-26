import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaborativeDocPresenceUpdaterStatusEntity
    extends DefaultDBStatusEntity {
  const CollaborativeDocPresenceUpdaterStatusEntity({required isUpdated})
      : super(isSent: isUpdated);
}
