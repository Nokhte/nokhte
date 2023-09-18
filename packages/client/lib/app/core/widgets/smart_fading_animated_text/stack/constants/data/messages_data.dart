import 'package:primala/app/core/widgets/widget_constants.dart';

class MessagesData {
  static List<RotatingTextData> get homeList => [
        RotatingTextData(
            mainMessage: "Schedule A Time With Your Collaborator",
            subMessage: "",
            pauseHere: false,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 2),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
            mainMessage: "Double Tap",
            subMessage: "",
            pauseHere: true,
            unlockGesture: Gestures.doubleTap,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
            mainMessage: "",
            subMessage: "\n tap to copy",
            pauseHere: true,
            unlockGesture: Gestures.tap,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
            mainMessage: "Share Your Word With Your Collaborator",
            subMessage: "",
            pauseHere: false,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 1, milliseconds: 500),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
            mainMessage: "Swipe Up When You Are Both Ready",
            subMessage: "",
            pauseHere: false,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 1),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
      ];
  static List<RotatingTextData> get speakTheCollaboratorPhraseList => [
        RotatingTextData(
            mainMessage: "Hold The Audio Button",
            subMessage: "",
            pauseHere: true,
            unlockGesture: Gestures.hold,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
            mainMessage: "Speak Your Collaborator's Phrase",
            subMessage: "",
            pauseHere: false,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
      ];
  static List<RotatingTextData> get p2pPurposeSession => [
        RotatingTextData(
            mainMessage: "One of you has a question to start the conversation",
            subMessage: "",
            pauseHere: true,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 40.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
            mainMessage: "?",
            subMessage: "",
            pauseHere: true,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
        RotatingTextData(
          mainMessage:
              "Write one path of collective creation that stuck out to you.",
          subMessage: "",
          pauseHere: true,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
          mainMessageFontSize: 50.0,
          subMessageFontSize: 25.0,
        ),
        RotatingTextData(
          mainMessage: "Look At Your Partners proposal.",
          subMessage: "",
          pauseHere: true,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
          mainMessageFontSize: 50.0,
          subMessageFontSize: 25.0,
        ),
        RotatingTextData(
          mainMessage: ".",
          subMessage: "",
          pauseHere: true,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
          mainMessageFontSize: 50.0,
          subMessageFontSize: 25.0,
        ),
        RotatingTextData(
          mainMessage: "Now Make Your Collective Path Together.",
          subMessage: "",
          pauseHere: true,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
          mainMessageFontSize: 50.0,
          subMessageFontSize: 25.0,
        ),
        RotatingTextData(
            mainMessage:
                "Complete An Individual Session To Do Another Collective Session",
            subMessage: "",
            pauseHere: true,
            unlockGesture: Gestures.none,
            extraDelayTime: const Duration(seconds: 0),
            mainMessageFontSize: 50.0,
            subMessageFontSize: 25.0),
      ];
}
