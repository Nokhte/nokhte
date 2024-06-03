import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class LoginList {
  static List<RotatingTextData> get list => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "Howdy",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          mainMessage:
              "The point of the app is to collectively uplift ideas into reality",
          subMessage: "Tap anywhere to confirm",
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
          onScreenTime: Seconds.get(2),
        ),
      ];
}
