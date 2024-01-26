import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class PerspectivesCommitStatusEntity extends DefaultDBStatusEntity {
  const PerspectivesCommitStatusEntity({required bool isCommitted})
      : super(isSent: isCommitted);
}
