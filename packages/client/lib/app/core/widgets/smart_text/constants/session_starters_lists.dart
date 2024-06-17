import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionStartersList {
  static List<RotatingTextData> get hasDoneInstructions => [
        RotatingTextData(
          text: "Scan to join",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          text: "That is where you go to get home",
          subText: "Tap anywhere to confirm",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get hasNotDoneInstructions => [
        RotatingTextData(
          text: "Tap on the cross",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe left",
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          text: "This is where you go to choose the session type",
          subText: "Tap anywhere to confirm",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe left",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];
}
