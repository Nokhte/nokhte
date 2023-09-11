import 'package:primala/app/core/entities/default_db_status_entity.dart';

class CollaborativeDocUpdateStatusEntity extends DefaultDBStatusEntity {
  const CollaborativeDocUpdateStatusEntity({required isUpdated})
      : super(isSent: isUpdated);
}
