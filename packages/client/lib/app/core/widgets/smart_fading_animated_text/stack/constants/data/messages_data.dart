import '../types/gestures.dart';

class MessagesData {
  static List get list => [
        {
          "mainMessage": "Schedule A Time With Your Collaborator",
          "subMessage": "",
          "pauseHere": false,
          "unlockGesture": Gestures.none,
          "extraDelayTime": const Duration(seconds: 2),
        },
        {
          "mainMessage": "Double Tap",
          "subMessage": "",
          "pauseHere": true,
          "unlockGesture": Gestures.doubleTap,
          "extraDelayTime": const Duration(seconds: 0),
        },
        {
          "mainMessage": "\$SOME PHRASE",
          "subMessage": "\n tap to copy",
          "pauseHere": true,
          "unlockGesture": Gestures.tap,
          "extraDelayTime": const Duration(seconds: 0),
        },
        {
          "mainMessage": "Share Your Word With Your Collaborator",
          "subMessage": "",
          "pauseHere": false,
          "unlockGesture": Gestures.none,
          "extraDelayTime": const Duration(seconds: 1, milliseconds: 500),
        },
        {
          "mainMessage": "Swipe Up When You Are Both Ready",
          "subMessage": "",
          "pauseHere": false,
          "unlockGesture": Gestures.none,
          "extraDelayTime": const Duration(seconds: 1),
        }
      ];
}
