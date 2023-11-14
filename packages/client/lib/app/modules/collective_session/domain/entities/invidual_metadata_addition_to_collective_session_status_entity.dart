import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class InvidualMetadataAdditionToCollectiveSessionStatusEntity
    extends DefaultDBStatusEntity {
  const InvidualMetadataAdditionToCollectiveSessionStatusEntity(
      {required bool isAdded})
      : super(isSent: isAdded);
}
