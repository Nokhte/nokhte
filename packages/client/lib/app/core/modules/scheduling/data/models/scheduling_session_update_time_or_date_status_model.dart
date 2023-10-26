// import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

// class SchedulingSesesionUpdateTimeorDateStatusEntity
//     extends DefaultDBStatusEntity {
//   const SchedulingSesesionUpdateTimeorDateStatusEntity(
//       {required bool isUpdated})
//       : super(isSent: isUpdated);
// }

import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';

class SchedulingSessionUpdateTimeOrDateStatusModel
    extends SchedulingSessionUpdateTimeOrDateStatusEntity {
  const SchedulingSessionUpdateTimeOrDateStatusModel(
      {required super.isUpdated});
}
