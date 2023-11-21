import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class WhoIsTalkingUpdateStatusEntity extends DefaultDBStatusEntity {
  const WhoIsTalkingUpdateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
