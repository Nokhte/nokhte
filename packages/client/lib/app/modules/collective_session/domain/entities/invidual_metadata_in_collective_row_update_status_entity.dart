import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class IndividualMetadataInCollectiveRowUpdateStatusEntity
    extends DefaultDBStatusEntity {
  const IndividualMetadataInCollectiveRowUpdateStatusEntity(
      {required bool isUpdated})
      : super(isSent: isUpdated);
}
