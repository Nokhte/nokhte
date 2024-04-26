import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionStartersList {
  static List<RotatingTextData> get list => [
        RotatingTextData(
          mainMessage: "Scan to join",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "That is where you go to get home",
          subMessage: "Tap anywhere to confirm",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];
}
