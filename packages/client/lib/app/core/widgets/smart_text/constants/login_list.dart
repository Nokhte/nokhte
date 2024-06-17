import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class LoginList {
  static List<RotatingTextData> get list => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          text: "Howdy",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          text:
              "The point of the app is to collectively uplift ideas into reality",
          subText: "Tap anywhere to confirm",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          pauseHere: true,
          onScreenTime: Seconds.get(2),
        ),
      ];
}
