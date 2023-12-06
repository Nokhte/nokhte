import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class TimerRunningUpdateStatusEntity extends DefaultDBStatusEntity {
  const TimerRunningUpdateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
