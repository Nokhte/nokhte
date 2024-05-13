import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
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
          hasEnteredStorage: false,
          userUID: "",
          hasCompletedNoktheSession: false);
    } else {
      return UserJourneyInfoModel(
        userUID: userNamesRes.first['uid'],
        hasGoneThroughInvitationFlow:
            userNamesRes.first['has_gone_through_invitation_flow'],
        hasSentAnInvitation: userNamesRes.first['has_sent_an_invitation'],
        hasCompletedNoktheSession:
            hasCompletedNokhteSession(finishedNokhteSessionsRes),
        hasEnteredStorage: userNamesRes.first['has_entered_storage'],
      );
    }
  }

  static bool hasCompletedNokhteSession(List nokhteSessionRes) {
    bool hasCompletedNokhteSession = false;
    for (var session in nokhteSessionRes) {
      if (session['content'].isNotEmpty) {
        hasCompletedNokhteSession = true;
      }
    }
    return hasCompletedNokhteSession;
  }
}
