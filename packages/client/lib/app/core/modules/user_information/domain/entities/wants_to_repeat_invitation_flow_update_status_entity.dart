import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class WantsToRepeatInvitationFlowUpdateStatusEntity
    extends DefaultDBStatusEntity {
  const WantsToRepeatInvitationFlowUpdateStatusEntity({
    required bool isUpdated,
  }) : super(isSent: isUpdated);

  static WantsToRepeatInvitationFlowUpdateStatusEntity get initial =>
      const WantsToRepeatInvitationFlowUpdateStatusEntity(isUpdated: false);
}
