import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class StorageLists {
  static List<RotatingTextData> get contentSecondary => [
        RotatingTextData(
          text: "",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go view your sessions",
          subText: "Tap anywhere to confirm",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get homeSecondary => [
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to get home",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get homeHeader => [
        RotatingTextData(
          text: "Sessions:",
          pauseHere: true,
          mainFontSize: 40.0,
        ),
      ];
}
