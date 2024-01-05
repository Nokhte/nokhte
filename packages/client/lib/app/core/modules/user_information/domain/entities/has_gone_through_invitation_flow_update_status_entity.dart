import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class HasGoneThroughInvitationFlowUpdateStatusEntity
    extends DefaultDBStatusEntity {
  const HasGoneThroughInvitationFlowUpdateStatusEntity(
      {required bool isUpdated})
      : super(isSent: isUpdated);

  static HasGoneThroughInvitationFlowUpdateStatusEntity get initial =>
      const HasGoneThroughInvitationFlowUpdateStatusEntity(isUpdated: false);
}
