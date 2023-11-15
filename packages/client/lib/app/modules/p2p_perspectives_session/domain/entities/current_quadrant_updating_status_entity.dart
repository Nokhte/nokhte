import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CurrentQuadrantUpdatingStatusEntity extends DefaultDBStatusEntity {
  const CurrentQuadrantUpdatingStatusEntity({required bool isUpdated})
      : super(isSent: isUpdated);
}
