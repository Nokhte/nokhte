import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class StagingAreaUpdateStatusEntity extends DefaultDBStatusEntity {
  const StagingAreaUpdateStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
