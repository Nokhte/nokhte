import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/types/types.dart';

class SessionStartersList {
  static List<RotatingTextData> get activeQrCode => [
        RotatingTextData(
          text: "Scan to join",
          onScreenTime: Seconds.get(3),
        ),
        RotatingTextData(
          text: "Scroll up for more",
          onScreenTime: Seconds.get(3),
        ),
        SharedLists.emptyItem,
      ];

  static List<RotatingTextData> get inactiveQrCode => [
        RotatingTextData(
          text: "Scroll up to select a session",
          mainFontSize: 20.0,
        ),
      ];

  static List<RotatingTextData> get qrScanner => [
        RotatingTextData(
          text: "Looking",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Joined",
          pauseHere: true,
        ),
        SharedLists.emptyItem,
      ];
}
