import 'package:primala/app/core/entities/default_db_status_entity.dart';

class P2PSchedulingRequestStatusEntity extends DefaultDBStatusEntity {
  const P2PSchedulingRequestStatusEntity({
    required isSent,
  }) : super(isSent: isSent);
}
