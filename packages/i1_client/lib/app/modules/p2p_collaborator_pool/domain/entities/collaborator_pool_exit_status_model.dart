import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class CollaboratorPoolExitStatusEntity extends DefaultDBStatusEntity {
  const CollaboratorPoolExitStatusEntity({required hasLeft})
      : super(isSent: hasLeft);
}
