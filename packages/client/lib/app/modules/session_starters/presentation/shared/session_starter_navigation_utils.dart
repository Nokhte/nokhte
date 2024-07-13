import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

mixin SessionStarterNavigationUtils {
  GetUserInfoStore get getUserInfo;

  String getRoute() {
    if (getUserInfo.hasAccessedQrCode) {
      if (getUserInfo.hasAccessedQrCodeScanner) {
        return SessionStarterConstants.sessionStarter;
      } else {
        return SessionStarterConstants.sessionJoinerInstructions;
      }
    } else {
      if (!getUserInfo.hasAccessedQrCodeScanner) {
        return SessionStarterConstants.sessionInstructionsPicker;
      } else {
        return SessionStarterConstants.sessionStarterInstructions;
      }
    }
  }
}
