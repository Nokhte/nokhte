import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class IndividualSessionMetadataUpdateStatusEntity
    extends DefaultDBStatusEntity {
  const IndividualSessionMetadataUpdateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
