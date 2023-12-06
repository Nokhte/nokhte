import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class IndividualCollaboratorEntryStatusEntity extends DefaultDBStatusEntity {
  const IndividualCollaboratorEntryStatusEntity({required bool hasEntered})
      : super(isSent: hasEntered);
}
