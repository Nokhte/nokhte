import 'package:nokhte/app/modules/home/domain/domain.dart';
import 'package:nokhte_backend/tables/user_names.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
  });

  factory UserJourneyInfoModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const UserJourneyInfoModel(
        hasGoneThroughInvitationFlow: false,
        hasSentAnInvitation: false,
      );
    } else {
      return UserJourneyInfoModel(
        hasGoneThroughInvitationFlow:
            res.first[UserNamesQueries.hasGoneThroughInvitationFlow],
        hasSentAnInvitation: res.first[UserNamesQueries.hasSentAnInvitation],
      );
    }
  }
}
