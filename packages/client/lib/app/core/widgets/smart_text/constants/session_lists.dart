import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionLists {
  static List<RotatingTextData> speakingInstructionsError = [
    RotatingTextData(
      mainMessage: "Set the phone down to continue",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakingWaiting = [
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

  static List<RotatingTextData> speakLessWriteMorePrimary = [
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
  static List<RotatingTextData> speakLessWriteMore = [
    RotatingTextData(
      mainMessage: "Speak less, write more",
      subMessage: "Tap anywhere to confirm",
      pauseHere: true,
      initialFadeInDelay: Seconds.get(1),
    ),
    RotatingTextData(
      mainMessage: "",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakLessWriteMoreSecondary = [
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

  static List<RotatingTextData> leaderLobby = [
    RotatingTextData(
      mainMessage: "Tap to begin",
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> followerLobby = [
    RotatingTextData(
      mainMessage: "Wait for the session to start",
      mainMessageFontSize: 23.0,
      pauseHere: true,
    ),
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

  static List<RotatingTextData> duoGreeterPrimary = [
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

  static List<RotatingTextData> duoGreeterSecondary = [
    RotatingTextData(
      mainMessage: "Tap when you have done so",
      pauseHere: true,
      mainMessageFontSize: 20.0,
    ),
    RotatingTextData(
      mainMessage: "Tap when you have done so",
      pauseHere: true,
      mainMessageFontSize: 20.0,
    ),
  ];
  static List<RotatingTextData> groupGreeterSecondary = [
    RotatingTextData(
      mainMessage: "Tap when you have done so",
      pauseHere: true,
      mainMessageFontSize: 20.0,
    ),
    RotatingTextData(
      mainMessage: "Tap when you have done so",
      pauseHere: true,
      mainMessageFontSize: 20.0,
    ),
    RotatingTextData(
      mainMessage: "Tap when you have done so",
      pauseHere: true,
      mainMessageFontSize: 20.0,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
      mainMessageFontSize: 20.0,
    ),
  ];

  static List<RotatingTextData> getGroupGreeterPrimary({
    required int numberOfCollaborators,
    required int userIndex,
  }) {
    final adjacentNumbers = AdjacentNumbers.getAdjacentNumbers(
      numberOfCollaborators,
      userIndex + 1,
      includeIndex: false,
    );
    return [
      RotatingTextData(
        mainMessage: "Put your phone on do not disturb",
        pauseHere: true,
        mainMessageFontSize: 24.0,
      ),
      RotatingTextData(
        mainMessage:
            "Make a circle and sit next to ${adjacentNumbers.first} and ${adjacentNumbers.last}",
        pauseHere: true,
        mainMessageFontSize: 24.0,
      ),
      RotatingTextData(
        mainMessage:
            "Place your phone halfway between you and ${adjacentNumbers.last}",
        pauseHere: true,
        mainMessageFontSize: 24.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
      RotatingTextData(
        mainMessage: "Wait for the others",
        pauseHere: true,
      ),
    ];
  }

  static List<RotatingTextData> speakingInstructionsPrimary = [
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

  static List<RotatingTextData> hybridSpeakingInstructionsPrimary = [
    RotatingTextData(
      mainMessage: "The point of this side is to limit speaking",
      pauseHere: true,
      mainMessageFontSize: 22.0,
    ),
    RotatingTextData(
      mainMessage: "You can only speak when your finger is on the screen",
      pauseHere: true,
      mainMessageFontSize: 22.0,
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
      mainMessageFontSize: 22.0,
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "Let go",
      mainMessageFontSize: 22.0,
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> hybridSpeakingInstructionsSecondary = [
    RotatingTextData(
      mainMessage: "Tap to confirm",
      pauseHere: true,
      mainMessageFontSize: 19.0,
    ),
    RotatingTextData(
      mainMessage: "Tap to confirm",
      pauseHere: true,
      mainMessageFontSize: 19.0,
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
      mainMessageFontSize: 19.0,
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      mainMessageFontSize: 19.0,
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> lookAtTheOtherPhone = [
    RotatingTextData(
      mainMessage: "Look at the other phone",
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> waitForTheOthers = [
    RotatingTextData(
      mainMessage: "Wait for the others",
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakingInstructionsSecondary = [
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

  static List<RotatingTextData> touchToTalk = [
    RotatingTextData(
      mainMessage: "Touch to talk",
      pauseHere: true,
      mainMessageFontSize: 19.0,
    ),
  ];
  static List<RotatingTextData> tapToTakeANote = [
    RotatingTextData(
      mainMessage: "Tap to take a note",
      pauseHere: true,
      mainMessageFontSize: 19.0,
    ),
  ];

  static List<RotatingTextData> getHybridNotesInstructionsPrimary({
    bool shouldAdjustToFallbackExitProtocol = false,
  }) {
    final arr = [
      RotatingTextData(
        mainMessage: "This phone will be used for notes",
        pauseHere: true,
        mainMessageFontSize: 22.0,
      ),
      RotatingTextData(
        mainMessage:
            "To complete the session ${shouldAdjustToFallbackExitProtocol ? "swipe down on all the phones" : "pick up all the phones"}",
        pauseHere: true,
        mainMessageFontSize: 22.0,
      ),
      RotatingTextData(
        mainMessage: "",
        pauseHere: true,
      ),
    ];
    return arr;
  }

  static List<RotatingTextData> hybridNotesInstructionsSecondary = [
    RotatingTextData(
      mainMessage: "Tap to confirm",
      pauseHere: true,
      mainMessageFontSize: 19.0,
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

  static List<RotatingTextData> getNotesInstructionsPrimary(
    MirroredTextOrientations orientation, {
    bool shouldAdjustToFallbackExitProtocol = false,
  }) {
    final arr = [
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
      arr.removeAt(0);
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
      arr.removeAt(0);
    }
    return arr;
  }

  static List<RotatingTextData> paywallPrimaryList = [
    RotatingTextData(
      mainMessage: "Sessions with more than 3 people require everyone to pay",
      subMessage: "Tap to confirm",
      subMessageFontSize: 18.0,
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "Groups with more than 3 people require more commitment",
      subMessage: "Tap to confirm",
      subMessageFontSize: 18.0,
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "\$4.99/month",
      pauseHere: true,
    ),
    RotatingTextData(
      mainMessage: "",
      pauseHere: true,
    ),
  ];
  static List<RotatingTextData> swipeUpToPay = [
    RotatingTextData(
      mainMessage: "Swipe up to pay",
      pauseHere: true,
    ),
  ];
  static List<RotatingTextData> swipeDownToExit = [
    RotatingTextData(
      mainMessage: "Swipe down to exit",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> notesPrimary = [
    RotatingTextData(
      mainMessage: "Swipe up to submit",
      pauseHere: true,
      mainMessageFontSize: 22.0,
    ),
  ];

  static List<RotatingTextData> exitTopText = [
    RotatingTextData(
      mainMessage: "Swipe up to Exit",
      pauseHere: true,
      mainMessageFontSize: 22.0,
    ),
  ];
  static List<RotatingTextData> exitBottomText = [
    RotatingTextData(
      mainMessage: "Swipe down to continue",
      pauseHere: true,
      mainMessageFontSize: 22.0,
    ),
  ];

  static List<RotatingTextData> exitWaiting = [
    RotatingTextData(
      mainMessage: "Waiting",
      pauseHere: true,
    ),
  ];
}
