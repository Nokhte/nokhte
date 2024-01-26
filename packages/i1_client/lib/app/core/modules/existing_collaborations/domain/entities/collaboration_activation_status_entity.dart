import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaborationActivationStatusEntity extends DefaultDBStatusEntity {
  const CollaborationActivationStatusEntity({required bool isActivated})
      : super(isSent: isActivated);
}
