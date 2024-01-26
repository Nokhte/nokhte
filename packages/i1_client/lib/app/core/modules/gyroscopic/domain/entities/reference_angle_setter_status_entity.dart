import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class ReferenceAngleSetterStatusEntity extends DefaultDBStatusEntity {
  const ReferenceAngleSetterStatusEntity({required bool isSet})
      : super(isSent: isSet);
}
