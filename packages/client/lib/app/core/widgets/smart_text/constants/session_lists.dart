import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionLists {
  static List<RotatingTextData> speakingInstructionsError = [
    RotatingTextData(
      text: "Set the phone down to continue",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakingWaiting = [
    RotatingTextData(
      text: "Continue on the other phone",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakLessWriteMorePrimary = [
    RotatingTextData(
      text: "Speak less, write more",
      pauseHere: true,
      initialFadeInDelay: Seconds.get(1),
    ),
    RotatingTextData(
      text: "",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
  ];
  static List<RotatingTextData> speakLessWriteMore = [
    RotatingTextData(
      text: "Speak less, write more",
      subText: "Tap anywhere to confirm",
      pauseHere: true,
      initialFadeInDelay: Seconds.get(1),
    ),
    RotatingTextData(
      text: "",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakLessWriteMoreSecondary = [
    RotatingTextData(
      text: '',
      subText: "Tap anywhere to confirm",
      pauseHere: true,
      initialFadeInDelay: Seconds.get(1),
    ),
    RotatingTextData(
      text: "",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    )
  ];

  static List<RotatingTextData> leaderLobby = [
    RotatingTextData(
      text: "Tap to begin",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> followerLobby = [
    RotatingTextData(
      text: "Wait for the session to start",
      mainFontSize: 23.0,
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Wait for the session to start",
      mainFontSize: 23.0,
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> trialGreeterPrimary = [
    RotatingTextData(
      text: "This is your only Trial Group Session",
      pauseHere: true,
      mainFontSize: 24.0,
    ),
  ];

  static List<RotatingTextData> trialGreeterSecondary = [
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 20.0,
    ),
  ];

  static List<RotatingTextData> duoGreeterPrimary = [
    RotatingTextData(
      text: "Put your phone on do not disturb",
      pauseHere: true,
      mainFontSize: 24.0,
    ),
    RotatingTextData(
      text: "Put both phones in a position both of you can reach",
      pauseHere: true,
      mainFontSize: 24.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Tap on the other phone to continue",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> duoGreeterSecondary = [
    RotatingTextData(
      text: "Tap when you have done so",
      pauseHere: true,
      mainFontSize: 20.0,
    ),
    RotatingTextData(
      text: "Tap when you have done so",
      pauseHere: true,
      mainFontSize: 20.0,
    ),
  ];
  static List<RotatingTextData> groupGreeterSecondary = [
    RotatingTextData(
      text: "Tap when you have done so",
      pauseHere: true,
      mainFontSize: 20.0,
    ),
    RotatingTextData(
      text: "Tap when you have done so",
      pauseHere: true,
      mainFontSize: 20.0,
    ),
    RotatingTextData(
      text: "Tap when you have done so",
      pauseHere: true,
      mainFontSize: 20.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
      mainFontSize: 20.0,
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
        text: "Put your phone on do not disturb",
        pauseHere: true,
        mainFontSize: 24.0,
      ),
      RotatingTextData(
        text:
            "Make a circle and sit next to ${adjacentNumbers.first} and ${adjacentNumbers.last}",
        pauseHere: true,
        mainFontSize: 24.0,
      ),
      RotatingTextData(
        text:
            "Place your phone halfway between you and ${adjacentNumbers.last}",
        pauseHere: true,
        mainFontSize: 24.0,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "Wait for the others",
        pauseHere: true,
      ),
    ];
  }

  static List<RotatingTextData> speakingInstructionsPrimary = [
    RotatingTextData(
      text: "The point of this phone is to limit speaking",
      pauseHere: true,
      mainFontSize: 22.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "You can only speak when your finger is on the screen",
      pauseHere: true,
      mainFontSize: 22.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Now, put your finger on the screen",
      pauseHere: true,
      mainFontSize: 22.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Only you are allowed to speak right now",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Let go",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> youHaveAlreadyDoneThis = [
    RotatingTextData(
      text: "You have already done this",
      mainFontSize: 22.0,
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakingHalfInstructionsPrimary({
    required bool isHybrid,
  }) {
    String phoneOrSide = isHybrid ? "side" : "phone";
    return [
      RotatingTextData(
        text: "The point of this $phoneOrSide is to limit speaking",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "You can only speak when your finger is on the screen",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "Now, put your finger on the screen",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "Only you are allowed to speak right now",
        mainFontSize: 22.0,
        pauseHere: true,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "Let go",
        mainFontSize: 22.0,
        pauseHere: true,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
    ];
  }

  static List<RotatingTextData> speakingHalfInstructionsSecondary = [
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      mainFontSize: 19.0,
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      mainFontSize: 19.0,
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> lookAtTheOtherPhone = [
    RotatingTextData(
      text: "Look at the other phone",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> waitForTheOthers = [
    RotatingTextData(
      text: "Wait for the others",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> speakingInstructionsSecondary = [
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> touchToTalk = [
    RotatingTextData(
      text: "Touch to talk",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
  ];
  static List<RotatingTextData> tapToTakeANote = [
    RotatingTextData(
      text: "Tap to take a note",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
  ];

  static List<RotatingTextData> getNotesHalfInstructionsPrimary({
    required bool isHybrid,
  }) {
    String phoneOrSide = isHybrid ? "side" : "phone";
    final arr = [
      RotatingTextData(
        text: "This $phoneOrSide will be used for notes",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "To complete the session swipe down on all the phones",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
    ];
    return arr;
  }

  static List<RotatingTextData> notesHalfInstructionsSecondary = [
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "Tap to confirm",
      pauseHere: true,
      mainFontSize: 19.0,
    ),
    RotatingTextData(
      text: "",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> getNotesInstructionsPrimary(
      MirroredTextOrientations orientation) {
    final arr = [
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "This phone will be used for notes",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "To complete the session swipe down on both phones",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      RotatingTextData(
        text: "",
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
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "Tap to confirm",
        pauseHere: true,
        mainFontSize: 19.0,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
      RotatingTextData(
        text: "Tap to confirm",
        pauseHere: true,
        mainFontSize: 19.0,
      ),
      RotatingTextData(
        text: "",
        pauseHere: true,
      ),
    ];
    if (orientation == MirroredTextOrientations.rightSideUp) {
      arr.removeAt(0);
    }
    return arr;
  }

  static List<RotatingTextData> paywallPrimaryList({
    required num price,
    required String period,
    required String currencyCode,
  }) =>
      [
        RotatingTextData(
          text: "Pairs are free",
          subText: "Tap to confirm",
          subFontSize: 18.0,
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Trios are also free",
          subText: "Tap to confirm",
          subFontSize: 18.0,
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Groups larger than 4 require everyone to pay",
          subText: "Tap to confirm",
          subFontSize: 18.0,
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          subText: "",
          subFontSize: 18.0,
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          pauseHere: true,
        ),
      ];
  static List<RotatingTextData> swipeUpToPay = [
    RotatingTextData(
      text: "Swipe up to pay",
      pauseHere: true,
    ),
  ];
  static List<RotatingTextData> swipeToDecide = [
    RotatingTextData(
      text: "Swipe to decide",
      mainFontSize: 18.0,
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> notesPrimary = [
    RotatingTextData(
      text: "Swipe up to submit",
      pauseHere: true,
      mainFontSize: 22.0,
    ),
  ];

  static List<RotatingTextData> waitingToLeave = [
    RotatingTextData(
      text: "Waiting to leave",
      pauseHere: true,
      mainFontSize: 22.0,
    ),
  ];
  static List<RotatingTextData> exitBottomText = [
    RotatingTextData(
      text: "Swipe down to cancel",
      pauseHere: true,
      mainFontSize: 22.0,
    ),
  ];

  static List<RotatingTextData> exitWaiting = [
    RotatingTextData(
      text: "Waiting",
      pauseHere: true,
    ),
  ];
}
