import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class WantsToRepeatInvitationFlowUpdateStatusModel
    extends WantsToRepeatInvitationFlowUpdateStatusEntity {
  const WantsToRepeatInvitationFlowUpdateStatusModel(
      {required super.isUpdated});

  static WantsToRepeatInvitationFlowUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const WantsToRepeatInvitationFlowUpdateStatusModel(
        isUpdated: false,
      );
    } else {
      return const WantsToRepeatInvitationFlowUpdateStatusModel(
        isUpdated: true,
      );
    }
  }
}
