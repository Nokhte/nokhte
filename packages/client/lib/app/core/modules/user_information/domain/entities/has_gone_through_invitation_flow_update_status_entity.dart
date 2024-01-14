import 'package:nokhte/app/core/entities/base_single_boolean_entity.dart';

class HasGoneThroughInvitationFlowUpdateStatusEntity
    extends BaseSingleBooleanEntity {
  const HasGoneThroughInvitationFlowUpdateStatusEntity(
      {required bool isUpdated})
      : super(isTrue: isUpdated);

  static HasGoneThroughInvitationFlowUpdateStatusEntity get initial =>
      const HasGoneThroughInvitationFlowUpdateStatusEntity(isUpdated: false);
}
