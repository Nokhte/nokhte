import 'package:flutter/material.dart';

class CanvasSizeCalculator {
  static Size squareCanvas({
    required BuildContext context,
    required double percentageLength,
  }) {
    double width = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding;
    double unrefinedHeight = MediaQuery.of(context).size.height;
    double height = unrefinedHeight - padding.top - padding.bottom;
    double desiredSize =
        width < height ? width * percentageLength : height * percentageLength;
    return Size(desiredSize, desiredSize);
  }
}
