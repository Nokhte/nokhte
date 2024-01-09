import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte_backend/tables/user_names.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
    required super.wantsToRepeatInvitationFlow,
    required super.userUID,
  });

  factory UserJourneyInfoModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const UserJourneyInfoModel(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
        userUID: "",
      );
    } else {
      return UserJourneyInfoModel(
        userUID: res.first[UserNamesQueries.uid],
        hasGoneThroughInvitationFlow:
            res.first[UserNamesQueries.hasGoneThroughInvitationFlow],
        hasSentAnInvitation: res.first[UserNamesQueries.hasSentAnInvitation],
        wantsToRepeatInvitationFlow:
            res.first[UserNamesQueries.wantsToRepeatInvitationFlow],
      );
    }
  }
}
