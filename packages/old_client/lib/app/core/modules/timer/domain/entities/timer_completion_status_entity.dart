import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class TimerCompletionStatusEntity extends DefaultDBStatusEntity {
  const TimerCompletionStatusEntity({required bool isCompleted})
      : super(isSent: isCompleted);
}
