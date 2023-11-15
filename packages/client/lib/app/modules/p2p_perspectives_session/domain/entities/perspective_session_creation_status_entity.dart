import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class PerspectiveSessionCreationStatusEntity extends DefaultDBStatusEntity {
  const PerspectiveSessionCreationStatusEntity({required bool isCreated})
      : super(isSent: isCreated);
}
