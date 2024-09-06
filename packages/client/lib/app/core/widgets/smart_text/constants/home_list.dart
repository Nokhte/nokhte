import 'package:nokhte/app/core/widgets/widgets.dart';

class HomeList {
  static List<RotatingTextData> get list => [
        RotatingTextData(
          text: "Tap on the compass to navigate",
          pauseHere: true,
        ),
        RotatingTextData(
          text: "Swipe to move",
          pauseHere: true,
          mainFontSize: 20,
        ),
        SharedLists.emptyItem,
      ];
}
