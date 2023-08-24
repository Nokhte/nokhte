import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/types/rotating_text_data.dart';
import '../types/gestures.dart';

class MessagesData {
  static List<RotatingTextData> get homeList => [
        RotatingTextData(
          mainMessage: "Schedule A Time With Your Collaborator",
          subMessage: "",
          pauseHere: false,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 2),
        ),
        RotatingTextData(
          mainMessage: "Double Tap",
          subMessage: "",
          pauseHere: true,
          unlockGesture: Gestures.doubleTap,
          extraDelayTime: const Duration(seconds: 0),
        ),
        RotatingTextData(
          mainMessage: "",
          subMessage: "\n tap to copy",
          pauseHere: true,
          unlockGesture: Gestures.tap,
          extraDelayTime: const Duration(seconds: 0),
        ),
        RotatingTextData(
          mainMessage: "Share Your Word With Your Collaborator",
          subMessage: "",
          pauseHere: false,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 1, milliseconds: 500),
        ),
        RotatingTextData(
          mainMessage: "Swipe Up When You Are Both Ready",
          subMessage: "",
          pauseHere: false,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 1),
        ),
      ];
  static List<RotatingTextData> get speakTheCollaboratorPhraseList => [
        RotatingTextData(
          mainMessage: "Hold The Audio Button",
          subMessage: "",
          pauseHere: true,
          unlockGesture: Gestures.hold,
          extraDelayTime: const Duration(seconds: 0),
        ),
        RotatingTextData(
          mainMessage: "Speak Your Collaborator's Phrase",
          subMessage: "",
          pauseHere: false,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
        ),
      ];
  static List<RotatingTextData> get collaboratorPoolList => [
        RotatingTextData(
          mainMessage: "Waiting On Collaborator",
          subMessage: "",
          pauseHere: false,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
        ),
        RotatingTextData(
          mainMessage: "Is Your Collaborator Online?",
          subMessage: "",
          pauseHere: false,
          unlockGesture: Gestures.none,
          extraDelayTime: const Duration(seconds: 0),
        ),
      ];
}
