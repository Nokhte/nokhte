import 'package:primala/app/core/entities/default_db_status_entity.dart';

class SchedulingSessionCreationStatusEntity extends DefaultDBStatusEntity {
  const SchedulingSessionCreationStatusEntity({required bool isCreated})
      : super(isSent: isCreated);
}
