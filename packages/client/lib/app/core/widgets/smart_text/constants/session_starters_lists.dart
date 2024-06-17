import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionStartersList {
  static List<RotatingTextData> get hasDoneInstructions => [
        RotatingTextData(
          text: "Scan to join",
          pauseHere: true,
        ),
        SharedLists.emptyItem,
        InstructionItems.homeExplanation,
        SharedLists.emptyItem,
      ];

  static List<RotatingTextData> get hasNotDoneInstructions => [
        InstructionItems.tapOnTheCompass,
        InstructionItems.swipeLeft,
        InstructionItems.presetsExplanation,
        InstructionItems.swipeLeft,
        SharedLists.emptyItem,
      ];
}
