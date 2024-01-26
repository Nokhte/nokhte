import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaborationConsecrationStatusEntity extends DefaultDBStatusEntity {
  const CollaborationConsecrationStatusEntity({required bool isConsecrated})
      : super(isSent: isConsecrated);
}
