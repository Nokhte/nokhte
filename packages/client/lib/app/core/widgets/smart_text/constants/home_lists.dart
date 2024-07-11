import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class HomeLists {
  static List<RotatingTextData> get storageGuide => [
        InstructionItems.tapOnTheCompass,
        InstructionItems.swipeLeft,
        InstructionItems.storageExplanation,
        InstructionItems.swipeLeft,
      ];

  static List<RotatingTextData> compassGuide(
          GestureDirections swipeDirection) =>
      [
        RotatingTextData(
          text: "If you're ever confused, Tap on the compass",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "The compass is a map of the app",
          subText: "Tap anywhere to confirm",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          text: "You are here",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "You move by swiping",
          subText: "Swipe ${SharedLists.getSwipeDirection(swipeDirection)}",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get shortQrGuide => [
        InstructionItems.tapOnTheCompass,
        InstructionItems.swipeUp,
        InstructionItems.sessionStarterExplanation,
        InstructionItems.swipeUp,
      ];

  static List<RotatingTextData> get qrAndStorageAdept => [
        SharedLists.emptyItem,
        InstructionItems.sessionStarterExplanation,
        SharedLists.emptyItem,
        InstructionItems.storageExplanation,
        SharedLists.emptyItem,
      ];

  static List<RotatingTextData> get compassAndStorageGuide => [
        ...compassGuide(GestureDirections.left),
        InstructionItems.storageExplanation,
        InstructionItems.swipeLeft,
      ];

  static List<RotatingTextData> get compassAndQrGuide => [
        ...compassGuide(GestureDirections.up),
        InstructionItems.sessionStarterExplanation,
        InstructionItems.swipeUp,
      ];

  static List<RotatingTextData> get qrNavigationReminder => [
        RotatingTextData(
          text: "Swipe up to start a session",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        SharedLists.emptyItem,
        InstructionItems.sessionStarterExplanation,
        SharedLists.emptyItem,
      ];
}
