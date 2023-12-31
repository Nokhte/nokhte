import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte_backend/tables/user_names.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
    required super.wantsToRepeatInvitationFlow,
  });

  factory UserJourneyInfoModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const UserJourneyInfoModel(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
        wantsToRepeatInvitationFlow: false,
      );
    } else {
      return UserJourneyInfoModel(
        hasGoneThroughInvitationFlow:
            res.first[UserNamesQueries.hasGoneThroughInvitationFlow],
        hasSentAnInvitation: res.first[UserNamesQueries.hasSentAnInvitation],
        wantsToRepeatInvitationFlow:
            res.first[UserNamesQueries.wantsToRepeatInvitationFlow],
      );
    }
  }
}
