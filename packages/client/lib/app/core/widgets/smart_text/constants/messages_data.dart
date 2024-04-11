import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

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
          mainMessage: "Tap Anywhere",
          unlockGesture: Gestures.tap,
          pauseHere: true,
          onScreenTime: Seconds.get(2),
        ),
      ];

  static List<RotatingTextData> get storageGuideList => [
        RotatingTextData(
          mainMessage: "Tap on the compass",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          mainMessage: "Swipe right",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          mainMessage: "That is where you go to view session notes",
          subMessage: "Tap anywhere to confirm",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "Swipe right",
          pauseHere: true,
        ),
      ];
  static List<RotatingTextData> get firstTimeHomeList => [
        RotatingTextData(
          mainMessage: "If you're ever confused, Tap on the compass",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
        RotatingTextData(
          mainMessage: "The compass is a map of the app",
          subMessage: "Tap anywhere to confirm",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          mainMessage: "You are here",
          subMessage: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "You move by swiping",
          subMessage: "Swipe Up",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "That is where you go to start a session",
          subMessage: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get hasDoneSessionInformationFlow => [
        RotatingTextData(
          mainMessage: "Swipe up to start a session",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "That is where you go to start a session",
          subMessage: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
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

  static List<RotatingTextData> get sessionSparkerList => [
        RotatingTextData(
          mainMessage: "Scan to join",
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "That is where you go to get home",
          subMessage: "Tap anywhere to confirm",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
        ),
        RotatingTextData(
          mainMessage: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get empty => [
        RotatingTextData(
          mainMessage: "",
          onScreenTime: Seconds.get(0),
        ),
      ];

  static List<RotatingTextData> get irlNokhteSessionGreeterPrimaryList => [
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

  static List<RotatingTextData> get irlNokhteSessionGreeterSecondaryList => [
        RotatingTextData(
          mainMessage: "Tap when you have done so",
          pauseHere: true,
          mainMessageFontSize: 20.0,
        ),
      ];

  static List<RotatingTextData>
      get irlNokhteSessionSpeakingInstructionsPrimaryList => [
            RotatingTextData(
              mainMessage: "Keep this phone on a flat surface",
              pauseHere: true,
              mainMessageFontSize: 22.0,
            ),
            RotatingTextData(
              mainMessage: "",
              pauseHere: true,
            ),
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
              mainMessage: "Hold on this side",
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

  static List<RotatingTextData>
      get irlNokhteSessionSpeakingInstructionsSecondaryPhase0List => [
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
  static List<RotatingTextData>
      get irlNokhteSessionSpeakingPhoneSecondaryPhase0List => [
            RotatingTextData(
              mainMessage: "Hold to speak",
              pauseHere: true,
              mainMessageFontSize: 19.0,
            ),
          ];

  static List<RotatingTextData>
      getIrlNokhteSessionNotesInstructionsPrimaryPhase0List(
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

  static List<RotatingTextData>
      getIrlNokhteSessionNotesInstructionsSecondaryPhase0List(
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

  static List<RotatingTextData> get notesSessionPrimaryList => [
        RotatingTextData(
          mainMessage: "Swipe up to submit",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];

  static List<RotatingTextData> get nokhteSessionExitScreenTopText => [
        RotatingTextData(
          mainMessage: "Swipe up to Exit",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];
  static List<RotatingTextData> get nokhteSessionExitScreenBottom => [
        RotatingTextData(
          mainMessage: "Swipe down to continue",
          pauseHere: true,
          mainMessageFontSize: 22.0,
        ),
      ];

  static List<RotatingTextData> get nokhteSessionExitWaiting => [
        RotatingTextData(
          mainMessage: "Waiting",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get storageHeader => [
        RotatingTextData(
          mainMessage: "Sessions:",
          pauseHere: true,
          mainMessageFontSize: 40.0,
        ),
      ];

  static List<RotatingTextData> getErrorList(String errorMessage) => [
        RotatingTextData(
          mainMessage: errorMessage,
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get errorConfirmList => [
        RotatingTextData(
          mainMessage: "Tap to confirm",
          pauseHere: true,
          mainMessageFontSize: 19.0,
        ),
      ];
}
