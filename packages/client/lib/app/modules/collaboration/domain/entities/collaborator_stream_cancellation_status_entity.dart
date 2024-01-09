import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaboratorStreamCancellationStatusEntity extends DefaultDBStatusEntity {
  const CollaboratorStreamCancellationStatusEntity({required isCancelled})
      : super(isSent: isCancelled);

  factory CollaboratorStreamCancellationStatusEntity.initial() =>
      const CollaboratorStreamCancellationStatusEntity(isCancelled: false);
}
