import 'package:primala/app/core/entities/default_db_status_entity.dart';

class ConfirmP2PSchedulingTimeStatusEntity extends DefaultDBStatusEntity {
  const ConfirmP2PSchedulingTimeStatusEntity({required bool isSent})
      : super(isSent: isSent);
}
