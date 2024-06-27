import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SessionLists {
  static RotatingTextData putYourPhoneOnDND = RotatingTextData(
    text: "Put your phone on do not disturb",
    pauseHere: true,
    mainFontSize: 24.0,
  );

  static List<RotatingTextData> speakingInstructionsError = [
    RotatingTextData(
      text: "Set the phone down to continue",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> previewHeader = [
    RotatingTextData(
      text: "Session Type",
      pauseHere: true,
      mainFontSize: 40.0,
    ),
  ];

  static List<RotatingTextData> speakingWaiting = [
    RotatingTextData(
      text: "Continue on the other phone",
      initialFadeInDelay: Seconds.get(1),
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> leaderLobby(String presetName) => [
        RotatingTextData(
          text: presetName,
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Tap to begin",
          pauseHere: true,
        ),
        SharedLists.emptyItem,
      ];

  static List<RotatingTextData> followerLobby = [
    RotatingTextData(
      text: "Wait for the session to start",
      mainFontSize: 23.0,
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> tapWhenYouHaveDoneSo(int length) => List.filled(
        length,
        RotatingTextData(
          text: "Tap when you have done so",
          pauseHere: true,
          mainFontSize: 20.0,
        ),
      );

  static List<RotatingTextData> trialGreeterPrimary = [
    RotatingTextData(
      text: "This is your only Trial Group Session",
      pauseHere: true,
      mainFontSize: 24.0,
    ),
  ];

  static List<RotatingTextData> trialGreeterSecondary = [
    SharedLists.tapToConfirm(20)
  ];

  static List<RotatingTextData> duoGreeterPrimary = [
    putYourPhoneOnDND,
    RotatingTextData(
      text: "Put both phones in a position both of you can reach",
      pauseHere: true,
      mainFontSize: 24.0,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "Tap on the other phone to continue",
      pauseHere: true,
    ),
  ];

  static List<RotatingTextData> duoGreeterSecondary = tapWhenYouHaveDoneSo(2);
  static List<RotatingTextData> groupGreeterSecondary = [
    ...tapWhenYouHaveDoneSo(3),
    SharedLists.emptyItem,
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
      putYourPhoneOnDND,
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
      SharedLists.emptyItem,
      RotatingTextData(
        text: "Wait for the others",
        pauseHere: true,
      ),
    ];
  }

  static List<RotatingTextData> speakingInstructionsPrimary = [
    RotatingTextData(
      text: "The point of this phone is to limit speaking", // !! REPEAT
      pauseHere: true,
      mainFontSize: 22.0,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "You can only speak when your finger is on the screen", // !! REPEAT
      pauseHere: true,
      mainFontSize: 22.0,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "Now, put your finger on the screen", // !! REPEAT
      pauseHere: true,
      mainFontSize: 22.0,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "Only you are allowed to speak right now", // !! REPEAT
      pauseHere: true,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "Let go", // !! REPEAT
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> youHaveAlreadyDoneThis = [
    RotatingTextData(
      text: "You have already done this",
      mainFontSize: 22.0,
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> speakingHalfInstructionsPrimary({
    required bool isHybrid,
    bool isHoldToTalk = true,
    bool showSubText = false,
  }) {
    String phoneOrSide = isHybrid ? "side" : "phone";
    return [
      RotatingTextData(
        text: "The point of this $phoneOrSide is to limit speaking",
        pauseHere: true,
        mainFontSize: 22.0,
        subText: showSubText ? "Tap to confirm" : "",
        subFontSize: 18.0,
      ),
      RotatingTextData(
        text: isHoldToTalk
            ? "You can only speak when your finger is on the screen"
            : "You can only speak when you tap on the screen",
        pauseHere: true,
        mainFontSize: 22.0,
        subText: showSubText ? "Tap to confirm" : "",
        subFontSize: 18.0,
      ),
      RotatingTextData(
        text: isHoldToTalk ? "Now, put your finger on the screen" : "Tap",
        pauseHere: true,
        mainFontSize: 22.0,
        subText: showSubText ? "" : "",
        subFontSize: 18.0,
      ),
      SharedLists.emptyItem,
      RotatingTextData(
        text: "Only you are allowed to speak right now",
        mainFontSize: 22.0,
        pauseHere: true,
        subText: showSubText ? "" : "",
        subFontSize: 18.0,
      ),
      SharedLists.emptyItem,
      RotatingTextData(
        text: isHoldToTalk ? "Let go" : "Tap again",
        mainFontSize: 22.0,
        pauseHere: true,
        subText: showSubText ? "" : "",
        subFontSize: 18.0,
      ),
      SharedLists.emptyItem,
    ];
  }

  static List<RotatingTextData> soloHybridInstructions = [
    ...speakingHalfInstructionsPrimary(
      isHybrid: true,
      isHoldToTalk: false,
      showSubText: true,
    ),
    ...getNotesHalfInstructionsPrimary(
      isHybrid: true,
      showSubText: true,
    ),
  ];

  static RotatingTextData thisIsYou = SharedLists.customTapToConfirmSub(
    "This is you",
    subTextFontSize: 18.0,
  );

  static RotatingTextData thatIsYourCollaborator =
      SharedLists.customTapToConfirmSub(
    "That is your collaborator",
    subTextFontSize: 18.0,
  );

  static List<RotatingTextData> socraticFullInstructions = [
    thisIsYou,
    thatIsYourCollaborator,
    SharedLists.customTapToConfirmSub(
      "All of the Phones will be used for speaking",
      subTextFontSize: 18.0,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> consultationTalkingSymbols = [
    thisIsYou,
    thatIsYourCollaborator,
    SharedLists.customTapToConfirmSub(
      "One phone will be used for speaking",
      subTextFontSize: 18.0,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> collaborationFullInstructions = [
    thisIsYou,
    SharedLists.customTapToConfirmSub(
      "Your phone will be used to talk and take notes",
      subTextFontSize: 18.0,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> consultationJustSymbols = [
    SharedLists.customTapToConfirmSub(
      "One phone will be used for speaking",
      subTextFontSize: 18.0,
    ),
    SharedLists.customTapToConfirmSub(
      "Another phone will be used for notes",
      subTextFontSize: 18.0,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> collaborationJustSymbols = [
    SharedLists.customTapToConfirmSub(
      "You can be anywhere in the room",
      subTextFontSize: 18.0,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> consultationNotesSymbols = [
    SharedLists.customTapToConfirmSub(
      "Another phone will be used for notes",
      subTextFontSize: 18.0,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> showGroupGeometry = [
    RotatingTextData(
      text: "2 Person Group",
      pauseHere: true,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "3 Person Group",
      pauseHere: true,
    ),
    SharedLists.emptyItem,
    RotatingTextData(
      text: "4 Person Group",
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> speakingHalfInstructionsSecondary = [
    SharedLists.tapToConfirm(19.0),
    SharedLists.tapToConfirm(19.0),
    ...SharedLists.genEmptyList(6),
  ];

  static List<RotatingTextData> lookAtTheOtherPhone = [
    RotatingTextData(
      text: "Look at the other phone",
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> waitForTheOthers = [
    RotatingTextData(
      text: "Wait for the others",
      pauseHere: true,
    ),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> speakingInstructionsSecondary = [
    SharedLists.tapToConfirm(19.0),
    SharedLists.emptyItem,
    SharedLists.tapToConfirm(19.0),
    ...SharedLists.genEmptyList(4),
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
    bool showSubText = false,
  }) {
    String phoneOrSide = isHybrid ? "side" : "phone";
    final arr = [
      RotatingTextData(
        text: "This $phoneOrSide will be used for notes",
        pauseHere: true,
        mainFontSize: 22.0,
        subText: showSubText ? "Tap to confirm" : "",
        subFontSize: 18.0,
      ),
      RotatingTextData(
        text: "To complete the session swipe down on all the phones",
        pauseHere: true,
        mainFontSize: 22.0,
        subText: showSubText ? "Tap to confirm" : "",
        subFontSize: 18.0,
      ),
      SharedLists.emptyItem,
    ];
    return arr;
  }

  static List<RotatingTextData> notesHalfInstructionsSecondary = [
    SharedLists.tapToConfirm(19.0),
    SharedLists.tapToConfirm(19.0),
    SharedLists.emptyItem,
  ];

  static List<RotatingTextData> getNotesInstructionsPrimary(
      MirroredTextOrientations orientation) {
    final arr = [
      SharedLists.emptyItem,
      RotatingTextData(
        text: "This phone will be used for notes",
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      SharedLists.emptyItem,
      RotatingTextData(
        text: "To complete the session swipe down on both phones", // !! REPEAT
        pauseHere: true,
        mainFontSize: 22.0,
      ),
      SharedLists.emptyItem,
    ];
    if (orientation == MirroredTextOrientations.rightSideUp) {
      arr.removeAt(0);
    }
    return arr;
  }

  static List<RotatingTextData> getNotesInstructionsSecondary(
      MirroredTextOrientations orientation) {
    final arr = [
      SharedLists.emptyItem,
      SharedLists.tapToConfirm(19),
      SharedLists.emptyItem,
      SharedLists.tapToConfirm(19),
      SharedLists.emptyItem,
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
        ...SharedLists.genEmptyList(2),
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
}
