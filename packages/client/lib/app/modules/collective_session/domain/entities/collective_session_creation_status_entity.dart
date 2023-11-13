import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollectiveSessionCreationStatusEntity extends DefaultDBStatusEntity {
  const CollectiveSessionCreationStatusEntity({required bool isCreated})
      : super(isSent: isCreated);
}
