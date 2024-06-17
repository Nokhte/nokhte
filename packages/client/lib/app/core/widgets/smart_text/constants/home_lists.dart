import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class HomeLists {
  static List<RotatingTextData> get storageGuide => [
        RotatingTextData(
          text: "Tap on the compass",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          text: "Swipe right",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          text: "That is where you go to view session notes",
          subText: "Tap anywhere to confirm",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe right",
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get shortQrGuide => [
        RotatingTextData(
          text: "Tap on the compass",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe up",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to start a session",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe up",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get qrAndStorageAdept => [
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to start a session",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to view session notes",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get compassAndStorageGuide => [
        RotatingTextData(
          text: "If you're ever confused, Tap on the compass",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "The compass is a map of the app",
          subText: "Tap anywhere to confirm",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          text: "You are here",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "You move by swiping",
          subText: "Swipe right",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to view session notes",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe right",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get compassAndQrGuide => [
        RotatingTextData(
          text: "If you're ever confused, Tap on the compass",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "The compass is a map of the app",
          subText: "Tap anywhere to confirm",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          text: "You are here",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "You move by swiping",
          subText: "Swipe Up",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to start a session",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get qrNavigationReminder => [
        RotatingTextData(
          text: "Swipe up to start a session",
          pauseHere: true,
          initialFadeInDelay: Seconds.get(1),
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "That is where you go to start a session",
          subText: "Tap anywhere to confirm",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
        RotatingTextData(
          text: "",
          initialFadeInDelay: Seconds.get(1),
          pauseHere: true,
        ),
      ];
}
