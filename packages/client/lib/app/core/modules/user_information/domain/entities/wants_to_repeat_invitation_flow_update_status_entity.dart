import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class WantsToRepeatInvitationFlowUpdateStatusEntity
    extends BaseSingleBooleanEntity {
  const WantsToRepeatInvitationFlowUpdateStatusEntity({
    required bool isUpdated,
  }) : super(isTrue: isUpdated);

  static WantsToRepeatInvitationFlowUpdateStatusEntity get initial =>
      const WantsToRepeatInvitationFlowUpdateStatusEntity(isUpdated: false);
}
