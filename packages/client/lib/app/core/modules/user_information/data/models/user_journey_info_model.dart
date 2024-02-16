import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
    required super.wantsToRepeatInvitationFlow,
    required super.userUID,
    required super.authorizedViewers,
  });

  factory UserJourneyInfoModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const UserJourneyInfoModel(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
        userUID: "",
        authorizedViewers: [],
      );
    } else {
      return UserJourneyInfoModel(
        userUID: res.first['uid'],
        hasGoneThroughInvitationFlow:
            res.first['has_gone_through_invitation_flow'],
        hasSentAnInvitation: res.first['has_sent_an_invitation'],
        wantsToRepeatInvitationFlow:
            res.first['wants_to_repeat_invitation_flow'],
        authorizedViewers: res.first["authorized_viewers"],
      );
    }
  }
}
