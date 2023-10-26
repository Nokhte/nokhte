import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaborativeDocUpdateCommitDesireStatusEntity
    extends DefaultDBStatusEntity {
  const CollaborativeDocUpdateCommitDesireStatusEntity(
      {required bool isUpdated})
      : super(isSent: isUpdated);
}
