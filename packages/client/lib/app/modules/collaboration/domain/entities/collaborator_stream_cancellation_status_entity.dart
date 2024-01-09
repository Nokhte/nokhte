import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaboratorStreamCancellationStatusEntity extends DefaultDBStatusEntity {
  const CollaboratorStreamCancellationStatusEntity({required isSubscribed})
      : super(isSent: isSubscribed);
}
