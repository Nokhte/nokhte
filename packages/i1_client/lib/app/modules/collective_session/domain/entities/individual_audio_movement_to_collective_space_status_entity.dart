import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class IndividualAudioMovementToCollectiveSpaceStatusEntity
    extends DefaultDBStatusEntity {
  const IndividualAudioMovementToCollectiveSpaceStatusEntity(
      {required bool isMoved})
      : super(isSent: isMoved);
}
