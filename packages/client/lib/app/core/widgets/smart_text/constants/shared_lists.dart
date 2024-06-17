import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SharedLists {
  static List<RotatingTextData> get emptyList => [
        RotatingTextData(
          text: "",
          onScreenTime: Seconds.get(0),
        ),
      ];

  static List<RotatingTextData> genEmptyList(int length) => List.filled(
        length,
        RotatingTextData(
          text: "",
          onScreenTime: Seconds.get(0),
        ),
      );

  static RotatingTextData get emptyItem => RotatingTextData(
        text: "",
        onScreenTime: Seconds.get(0),
      );

  static RotatingTextData tapToConfirm(double fontSize) => RotatingTextData(
        text: "Tap to confirm",
        mainFontSize: fontSize,
        pauseHere: true,
      );

  static List<RotatingTextData> getErrorList(String errorMessage) => [
        RotatingTextData(
          text: errorMessage,
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> customTapToConfirmSub(String text) => [
        RotatingTextData(
          text: text,
          subText: "Tap to confirm",
          pauseHere: true,
        ),
      ];

  static String getSwipeDirection(GestureDirections swipeDirection) {
    switch (swipeDirection) {
      case GestureDirections.up:
        return 'up';
      case GestureDirections.down:
        return 'down';
      case GestureDirections.left:
        return 'left';
      case GestureDirections.right:
        return 'right';
      default:
        return '';
    }
  }

  static List<RotatingTextData> get errorConfirmList => [
        RotatingTextData(
          // !! REPEAT
          text: "Tap to confirm",
          pauseHere: true,
          mainFontSize: 19.0,
        ),
      ];
}
