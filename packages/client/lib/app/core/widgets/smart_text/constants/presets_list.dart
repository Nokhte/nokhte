import 'package:nokhte/app/core/widgets/widgets.dart';

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
    SharedLists.emptyItem,
    RotatingTextData(
      text: "Hold to select",
      pauseHere: true,
    ),
    SharedLists.emptyItem,
    InstructionItems.tapOnTheCompass,
    InstructionItems.swipeRight,
    InstructionItems.sessionStarterExplanation,
    SharedLists.emptyItem,
  ];
}
