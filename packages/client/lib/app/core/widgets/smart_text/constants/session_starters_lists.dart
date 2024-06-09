import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionStartersList {
  static List<RotatingTextData> get hasDoneInstructions => [
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

  static List<RotatingTextData> get hasNotDoneInstructions => [
        RotatingTextData(
          mainMessage: "Tap on the cross",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Swipe left",
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "This is where you go to choose the session type",
          subMessage: "Tap anywhere to confirm",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Swipe left",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];
}
