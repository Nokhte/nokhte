import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class SoloDocSealingStatusEntity extends DefaultDBStatusEntity {
  const SoloDocSealingStatusEntity({required isSealed})
      : super(isSent: isSealed);
}
