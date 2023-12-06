import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class PresenceUpdateStatusEntity extends DefaultDBStatusEntity {
  const PresenceUpdateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
