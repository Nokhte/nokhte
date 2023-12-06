import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class TimerDeletionStatusEntity extends DefaultDBStatusEntity {
  const TimerDeletionStatusEntity({required bool isDeleted})
      : super(isSent: isDeleted);
}
