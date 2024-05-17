import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity {
  const UserJourneyInfoModel({
    required super.hasAccessedQrCode,
    required super.userUID,
    required super.hasCompletedASession,
    required super.hasEnteredStorage,
  });

  factory UserJourneyInfoModel.fromSupabase({
    required List userNamesRes,
    required List finishedNokhteSessionsRes,
  }) {
    if (userNamesRes.isEmpty) {
      return const UserJourneyInfoModel(
        hasAccessedQrCode: false,
        hasCompletedASession: false,
        hasEnteredStorage: false,
        userUID: "",
      );
    } else {
      return UserJourneyInfoModel(
        userUID: userNamesRes.first['uid'],
        hasAccessedQrCode: userNamesRes.first['has_accessed_qr_code'],
        hasCompletedASession:
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
