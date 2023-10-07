import 'package:primala/app/core/entities/default_db_status_entity.dart';

class SchedulingSessionUpdateTimeOrDateStatusEntity
    extends DefaultDBStatusEntity {
  const SchedulingSessionUpdateTimeOrDateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
