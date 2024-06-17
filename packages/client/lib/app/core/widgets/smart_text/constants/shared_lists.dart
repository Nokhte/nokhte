import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SharedLists {
  static List<RotatingTextData> get empty => [
        RotatingTextData(
          text: "",
          onScreenTime: Seconds.get(0),
        ),
      ];

  static List<RotatingTextData> getErrorList(String errorMessage) => [
        RotatingTextData(
          text: errorMessage,
          pauseHere: true,
        ),
      ];

  static List<RotatingTextData> get errorConfirmList => [
        RotatingTextData(
          text: "Tap to confirm",
          pauseHere: true,
          mainFontSize: 19.0,
        ),
      ];
}
