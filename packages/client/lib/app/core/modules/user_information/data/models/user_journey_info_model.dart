import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
    required super.wantsToRepeatInvitationFlow,
    required super.userUID,
    required super.hasCompletedNoktheSession,
    required super.hasEnteredStorage,
  });

  factory UserJourneyInfoModel.fromSupabase({
    required List userNamesRes,
    required List finishedNokhteSessionsRes,
  }) {
    if (userNamesRes.isEmpty) {
      return const UserJourneyInfoModel(
          hasGoneThroughInvitationFlow: false,
          hasSentAnInvitation: false,
          wantsToRepeatInvitationFlow: false,
          hasEnteredStorage: false,
          userUID: "",
          hasCompletedNoktheSession: false);
    } else {
      return UserJourneyInfoModel(
        userUID: userNamesRes.first['uid'],
        hasGoneThroughInvitationFlow:
            userNamesRes.first['has_gone_through_invitation_flow'],
        hasSentAnInvitation: userNamesRes.first['has_sent_an_invitation'],
        wantsToRepeatInvitationFlow:
            userNamesRes.first['wants_to_repeat_invitation_flow'],
        hasCompletedNoktheSession: finishedNokhteSessionsRes.isNotEmpty,
        hasEnteredStorage: userNamesRes.first['has_entered_storage'],
      );
    }
  }
}
