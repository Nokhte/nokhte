import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/types/types.dart';

class SessionStartersList {
  static List<RotatingTextData> get hasDoneInstructions => [
        SharedLists.emptyItem,
        InstructionItems.homeExplanation,
        SharedLists.emptyItem,
        InstructionItems.presetsExplanation,
        SharedLists.emptyItem,
      ];

  static List<RotatingTextData> getQrCodeSubtitle(String sessionName) => [
        RotatingTextData(
          text: "",
          onScreenTime: Seconds.get(0),
        ),
        RotatingTextData(
          text: "Scan to join",
          onScreenTime: Seconds.get(3),
        ),
        RotatingTextData(
          text: sessionName,
          onScreenTime: Seconds.get(3),
        ),
        SharedLists.emptyItem,
      ];

  static List<RotatingTextData> get sessionJoinerInstructions => [
        InstructionItems.tapOnTheCompass,
        InstructionItems.swipeRight,
        InstructionItems.sessionJoinerExplanation,
        InstructionItems.swipeRight,
        SharedLists.emptyItem,
      ];
}
