import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte_backend/tables/user_information.dart';

class UserJourneyInfoModel extends UserJourneyInfoEntity
    with UserInformationConstants {
  UserJourneyInfoModel({
    required super.hasAccessedQrCode,
    required super.userUID,
    required super.hasCompletedASession,
    required super.hasEnteredStorage,
    required super.isOnMostRecentVersion,
    required super.hasAccessedQrCodeScanner,
  });

  factory UserJourneyInfoModel.fromSupabase({
    required List userNamesRes,
    required List finishedNokhteSessionsRes,
    required bool isUpToDate,
  }) {
    if (userNamesRes.isEmpty) {
      return UserJourneyInfoModel(
        isOnMostRecentVersion: true,
        hasAccessedQrCode: false,
        hasCompletedASession: false,
        hasEnteredStorage: false,
        userUID: "",
        hasAccessedQrCodeScanner: false,
      );
    } else {
      return UserJourneyInfoModel(
        isOnMostRecentVersion: isUpToDate,
        userUID: userNamesRes.first[UserInformationConstants.S_UID],
        hasAccessedQrCode:
            userNamesRes.first[UserInformationConstants.S_PREFERRED_PRESET] !=
                null,
        hasCompletedASession:
            hasCompletedNokhteSession(finishedNokhteSessionsRes),
        hasEnteredStorage: userNamesRes.first[UserInformationConstants.S_FLAGS]
            [UserInformationConstants.S_HAS_ENTERED_STORAGE],
        hasAccessedQrCodeScanner:
            userNamesRes.first[UserInformationConstants.S_FLAGS]
                [UserInformationConstants.S_HAS_ACCESSED_QR_CODE_SCANNER],
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
