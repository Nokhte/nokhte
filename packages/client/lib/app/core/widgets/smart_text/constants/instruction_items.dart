import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class InstructionItems {
  static RotatingTextData sessionStarterExplanation = RotatingTextData(
    text: "That is where you go to start a session",
    subText: "Tap anywhere to confirm",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData storageExplanation = RotatingTextData(
    text: "That is where you go to view session notes",
    subText: "Tap anywhere to confirm",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData storageHomeExplanation = RotatingTextData(
    text: "That is where you go view your sessions",
    subText: "Tap anywhere to confirm",
    pauseHere: true,
  );

  static RotatingTextData homeExplanation = RotatingTextData(
    initialFadeInDelay: Seconds.get(1),
    text: "That is where you go to get home",
    subText: "Tap anywhere to confirm",
    onScreenTime: Seconds.get(0),
    pauseHere: true,
  );

  static RotatingTextData presetsExplanation = RotatingTextData(
    text: "This is where you go to choose the session type",
    subText: "Tap anywhere to confirm",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData tapOnTheCompass = RotatingTextData(
    text: "Tap on the compass",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData swipeRight = RotatingTextData(
    text: "Swipe right",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData swipeLeft = RotatingTextData(
    text: "Swipe left",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData swipeUp = RotatingTextData(
    text: "Swipe up",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );

  static RotatingTextData swipeDown = RotatingTextData(
    text: "Swipe down",
    initialFadeInDelay: Seconds.get(1),
    pauseHere: true,
  );
}
