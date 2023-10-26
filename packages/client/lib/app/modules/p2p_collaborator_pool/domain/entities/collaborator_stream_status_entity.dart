import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaboratorStreamStatusEntity extends DefaultDBStatusEntity {
  const CollaboratorStreamStatusEntity({required isSubscribed})
      : super(isSent: isSubscribed);
}
