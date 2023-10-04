import 'package:primala/app/core/entities/default_db_status_entity.dart';

class SchedulingSesesionUpdateTimeOrDateStatusEntity
    extends DefaultDBStatusEntity {
  const SchedulingSesesionUpdateTimeOrDateStatusEntity(
      {required bool isUpdated})
      : super(isSent: isUpdated);
}
