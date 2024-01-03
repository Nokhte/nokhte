import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';

class MessagesData {
  static List<RotatingTextData> get loginList => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "Howdy",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(2),
          mainMessage: "The Point Of The App Is",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(2),
          mainMessage: "To Collectively Uplift Ideas Into Reality",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(2),
          mainMessage: "Tap",
          unlockGesture: Gestures.tap,
          pauseHere: true,
          onScreenTime: Seconds.get(2),
        ),
      ];
  static List<RotatingTextData> get firstTimeHomeList => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "If you're ever confused, Tap on the cross",
          onScreenTime: Seconds.get(2),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage: "",
          onScreenTime: Seconds.get(0),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage:
              "Both of you need to be online at the same to make the collaboration.",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage: "",
          pauseHere: true,
          onScreenTime: Seconds.get(0),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "Swipe Up to Enter The Collaboration Page.",
          onScreenTime: Seconds.get(2),
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage: "",
          pauseHere: true,
          onScreenTime: Seconds.get(0),
        ),
      ];
  static List<RotatingTextData> get postInvitationFlowText => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage: "Tap on the yellow dot to make an invitation.",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
      ];

  static List<RotatingTextData> get firstTimeSecondaryHomeList => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage: "Tap on the overlapping time.",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage: "",
          onScreenTime: Seconds.get(0),
        ),
      ];
  static List<RotatingTextData> get empty => [
        RotatingTextData(
          mainMessage: "",
          onScreenTime: Seconds.get(0),
        ),
      ];
}
