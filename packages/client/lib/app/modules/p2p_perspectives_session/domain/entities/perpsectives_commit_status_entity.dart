import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class PerspectivesCommitStatusStatusEntity extends DefaultDBStatusEntity {
  const PerspectivesCommitStatusStatusEntity({required bool isCommitted})
      : super(isSent: isCommitted);
}
