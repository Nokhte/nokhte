import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class IndividualSessionCreationStatusEntity extends DefaultDBStatusEntity {
  const IndividualSessionCreationStatusEntity({required bool isCreated})
      : super(isSent: isCreated);
}
