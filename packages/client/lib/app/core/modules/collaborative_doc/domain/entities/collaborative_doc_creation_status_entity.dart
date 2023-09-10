import 'package:primala/app/core/entities/default_db_status_entity.dart';

class CollaborativeDocCreationStatusEntity extends DefaultDBStatusEntity {
  const CollaborativeDocCreationStatusEntity({required isCreated})
      : super(isSent: isCreated);
}
