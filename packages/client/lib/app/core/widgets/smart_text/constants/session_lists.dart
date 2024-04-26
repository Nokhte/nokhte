import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionLists {
  static List<RotatingTextData> get speakingInstructionsError => [
        RotatingTextData(
          mainMessage: "Set the phone down to continue",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get speakingWaiting => [
        RotatingTextData(
          mainMessage: "Continue on the other phone",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
      ];

  static List<RotatingTextData> get speakLessWriteMorePrimary => [
        RotatingTextData(
          mainMessage: "Speak less, write more",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get speakLessWriteMoreSecondary => [
        RotatingTextData(
          mainMessage: '',
          subMessage: "Tap anywhere to confirm",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        )
      ];

  static List<RotatingTextData> get leaderLobby => [
        RotatingTextData(
          mainMessage: "Tap to begin",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get followerLobby => [
        RotatingTextData(
          mainMessage: "Wait for the session to start",
          mainMessageFontSize: 23.0,
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get duoGreeterPrimary => [
        RotatingTextData(
          mainMessage: "Put your phone on do not disturb",
          pauseHere: true,
          mainMessageFontSize: 24.0,
        ),
        RotatingTextData(
          mainMessage: "Put both phones in a position both of you can reach",
          pauseHere: true,
          mainMessageFontSize: 24.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Tap on the other phone to continue",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get duoGreeterSecondary => [
        RotatingTextData(
          mainMessage: "Tap when you have done so",
          pauseHere: true,
          mainMessageFontSize: 20.0,
        ),
      ];

  static List<RotatingTextData> get speakingInstructionsPrimary => [
        RotatingTextData(
          mainMessage: "The point of this phone is to limit speaking",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "You can only speak when your finger is on the screen",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Now, put your finger on the screen",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Only you are allowed to speak right now",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Let go",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Continue on the other phone",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];

  static List<RotatingTextData> get speakingInstructionsSecondary => [
        RotatingTextData(
          mainMessage: "Tap to confirm",
          pauseHere: true,
          mainMessageFontSize: 19.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Tap to confirm",
          pauseHere: true,
          mainMessageFontSize: 19.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
          mainMessageFontSize: 19.0,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get speakingSecondary => [
        RotatingTextData(
          mainMessage: "Touch to talk",
          pauseHere: true,
          mainMessageFontSize: 19.0,
        ),
      ];
  //

  static List<RotatingTextData> getNotesInstructionsPrimary(
    MirroredTextOrientations orientation, {
    bool shouldAdjustToFallbackExitProtocol = false,
  }) {
    final arr = [
      RotatingTextData(
        mainMessage: "Look at the other phone",
        pauseHere: true,
        mainMessageFontSize: 22.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage: "This phone will be used for notes",
        pauseHere: true,
        mainMessageFontSize: 22.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage:
            "To complete the session ${shouldAdjustToFallbackExitProtocol ? "swipe down on both phones" : "pick up both phones"}",
        pauseHere: true,
        mainMessageFontSize: 22.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
    ];
    if (orientation == MirroredTextOrientations.rightSideUp) {
      arr.removeAt(1);
    }
    return arr;
  }

  static List<RotatingTextData> getNotesInstructionsSecondary(
      MirroredTextOrientations orientation) {
    final arr = [
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage: "Tap to confirm",
        pauseHere: true,
        mainMessageFontSize: 19.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage: "Tap to confirm",
        pauseHere: true,
        mainMessageFontSize: 19.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
    ];
    if (orientation == MirroredTextOrientations.rightSideUp) {
      arr.removeAt(1);
    }
    return arr;
  }

  static List<RotatingTextData> get notesPrimary => [
        RotatingTextData(
          mainMessage: "Swipe up to submit",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];

  static List<RotatingTextData> get exitTopText => [
        RotatingTextData(
          mainMessage: "Swipe up to Exit",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];
  static List<RotatingTextData> get exitBottomText => [
        RotatingTextData(
          mainMessage: "Swipe down to continue",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];

  static List<RotatingTextData> get exitWaiting => [
        RotatingTextData(
          mainMessage: "Waiting",
          pauseHere: true,
        ),
      ];
}
