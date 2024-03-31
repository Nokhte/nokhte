import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
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

  static List<RotatingTextData> get homeListHasDoneASession => [
        RotatingTextData(
          mainMessage: "Swipe right to see session notes",
          pauseHere: true,
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

  static List<RotatingTextData> get firstTimeCollaborationList => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "This is the collaboration page.",
          onScreenTime: Seconds.get(2),
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "To make an invitation tap on the yellow dot.",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
        ),
        RotatingTextData(
          initialFadeInDelay: Seconds.get(1),
          mainMessage: "Swipe Down to go Home.",
          onScreenTime: Seconds.get(2),
          pauseHere: true,
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

  static List<RotatingTextData> get postInvitationNoInvite => [
        RotatingTextData(
          initialFadeInDelay: Seconds.get(0),
          mainMessage:
              "Send An Invitation To Open Your Collaborator's Invitation.",
          onScreenTime: Seconds.get(0),
          pauseHere: true,
          unlockGesture: Gestures.tap,
        ),
      ];

  static List<RotatingTextData> get empty => [
        RotatingTextData(
          mainMessage: "",
          onScreenTime: Seconds.get(0),
        ),
      ];

  static List<RotatingTextData> get irlNokhteSessionPhase0PrimaryList => [
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

  static List<RotatingTextData> get irlNokhteSessionPhase0SecondaryList => [
        RotatingTextData(
          mainMessage: "Tap when you have done so",
          pauseHere: true,
          mainMessageFontSize: 20.0,
        ),
      ];

  static List<RotatingTextData>
      getIrlNokhteSessionSpeakingInstructionsPrimaryPhase0List(
          MirroredTextOrientations orientation) {
    final arr = [
      RotatingTextData(
        mainMessage: "Say: One person can speak at a time",
        pauseHere: true,
        mainMessageFontSize: 22.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage: "Hold on This Side When You Are Speaking",
        pauseHere: true,
        mainMessageFontSize: 22.0,
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
    if (orientation == MirroredTextOrientations.upsideDown) {
      arr.removeAt(3);
    }
    return arr;
  }

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
