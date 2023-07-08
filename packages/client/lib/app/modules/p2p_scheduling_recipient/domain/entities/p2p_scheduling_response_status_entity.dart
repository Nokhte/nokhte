import 'package:primala/app/core/entities/default_db_status_entity.dart';

class P2PSchedulingResponseStatusEntity extends DefaultDBStatusEntity {
  const P2PSchedulingResponseStatusEntity({required isSent})
      : super(isSent: isSent);
}
