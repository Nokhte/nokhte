import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class SoloDocCreationStatusEntity extends DefaultDBStatusEntity {
  const SoloDocCreationStatusEntity({required isCreated})
      : super(isSent: isCreated);
}
