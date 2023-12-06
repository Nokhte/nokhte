import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class TimerCreationStatusEntity extends DefaultDBStatusEntity {
  const TimerCreationStatusEntity({required bool isCreated})
      : super(isSent: isCreated);
}
