import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class InstructionItems {
  static const thatIsWhereYouGoTo = "That is where you go to";
  static const tapAnywhereToConfirm = "Tap anywhere to confirm";

  static RotatingTextData getExplanation(String explanationEnding) =>
      RotatingTextData(
        text: "$thatIsWhereYouGoTo $explanationEnding",
        subText: tapAnywhereToConfirm,
        initialFadeInDelay: Seconds.get(1),
        pauseHere: true,
      );

  static RotatingTextData sessionStarterExplanation =
      getExplanation("start a session");

  static RotatingTextData sessionJoinerExplanation =
      getExplanation("join a session");

  static RotatingTextData storageExplanation =
      getExplanation("view session notes");

  static RotatingTextData storageHomeExplanation =
      getExplanation("view your sessions");

  static RotatingTextData homeExplanation = getExplanation("get home");

  static RotatingTextData presetsExplanation =
      getExplanation("choose the session type");

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
