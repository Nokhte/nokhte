import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/types/types.dart';

class PresetsLists {
  static List<RotatingTextData> presetsHeader = [
    RotatingTextData(
      text: "Session Types",
      pauseHere: true,
      mainFontSize: 40.0,
    ),
  ];
  static List<RotatingTextData> presetsInstructions = [
    RotatingTextData(
      text: "Tap to explore",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Hold to select",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Tap on the cross",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Swipe right",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "That is where you go to start a session",
      subText: "Tap anywhere to confirm",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];
}
