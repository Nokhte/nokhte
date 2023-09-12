import 'package:primala/app/core/entities/default_db_status_entity.dart';

class CollaborativeDocDeltaUpdaterStatusEntity extends DefaultDBStatusEntity {
  const CollaborativeDocDeltaUpdaterStatusEntity({
    required isUpdated,
  }) : super(isSent: isUpdated);
}
