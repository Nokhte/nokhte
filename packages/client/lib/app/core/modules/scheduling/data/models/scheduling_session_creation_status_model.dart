// import 'package:primala/app/core/entities/default_db_status_entity.dart';

// class SchedulingSessionCreationStatusEntity extends DefaultDBStatusEntity {
//   const SchedulingSessionCreationStatusEntity({required bool isCreated})
//       : super(isSent: isCreated);
// }

import 'package:primala/app/core/modules/scheduling/domain/domain.dart';

class SchedulingSessionCreationStatusModel
    extends SchedulingSessionCreationStatusEntity {
  const SchedulingSessionCreationStatusModel({required super.isCreated});

  static SchedulingSessionCreationStatusModel fromSupabase(List res) {
    return const SchedulingSessionCreationStatusModel(isCreated: true);
  }
}
