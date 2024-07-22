import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

mixin PresetDiagramUtils {
  List<Offset> getCircleOffsets(
      Movie value, int numOfCircles, Size screenSize) {
    final List<Offset> temp = [];
    for (int i = 0; i < numOfCircles; i++) {
      temp.add(
        Offset(
          value.get('c${i + 1}.dx'),
          value.get('c${i + 1}.dy'),
        ),
      );
    }
    return temp;
  }

  List<double> getCircleStops(Movie value, int numOfCircles) {
    List<double> temp = [];
    for (int i = 0; i < numOfCircles; i++) {
      temp = [
        value.get('c1.st1'),
        value.get('c1.st2'),
        value.get('c1.st3'),
        value.get('c1.st4'),
        value.get('c1.st5'),
        value.get('c1.st6'),
        value.get('c1.st7'),
        value.get('c1.st8'),
      ];
    }
    return temp;
  }

  List<Color> getCircleColors(Movie value, int numOfCircles) => [
        value.get('c1.co1'),
        value.get('c1.co2'),
        value.get('c1.co3'),
        value.get('c1.co4'),
        value.get('c1.co5'),
        value.get('c1.co6'),
        value.get('c1.co7'),
        value.get('c1.co8'),
      ];

  List<double> getLineWidths(Movie value, int numOfLines) {
    final List<double> temp = [];
    for (int i = 0; i < numOfLines; i++) {
      temp.add(value.get('l${i + 1}.width'));
    }
    return temp;
  }

  List<List<Offset>> getLineOffsets(
    Movie value,
    int numOfLines,
    Size screenSize,
  ) {
    final List<List<Offset>> temp = [];
    for (int i = 0; i < numOfLines; i++) {
      temp.add([
        Offset(
          value.get('l${i + 1}.dx.start'),
          value.get('l${i + 1}.dy.start'),
        ),
        Offset(
          value.get('l${i + 1}.dx.end'),
          value.get('l${i + 1}.dy.end'),
        ),
      ]);
    }
    return temp;
  }

  List<double> getCircleRadii(Movie value, int numOfCircles) {
    final List<double> temp = [];
    for (int i = 0; i < numOfCircles; i++) {
      temp.add(value.get('c${i + 1}.rad'));
    }
    return temp;
  }

  normalizeOffsets({
    required Offset inputOffset,
    required Size screenSize,
    required bool isAStartingOffset,
    double extraBump = 0,
  }) {
    const bumpPerHundredth = .0007;
    final double currentAspectRatio = screenSize.height / screenSize.width;
    const double baselineAspectRatio = 844 / 390;

    final double aspectRatioDifference =
        currentAspectRatio - baselineAspectRatio;

    final double steps = aspectRatioDifference / 0.01;

    double x = inputOffset.dx;
    double y = inputOffset.dy;

    final double adjustment = steps * bumpPerHundredth;
    if (isAStartingOffset) {
      return Offset(
        x,
        (y - adjustment) - extraBump,
      );
    } else {
      return Offset(
        x,
        (y + adjustment) + extraBump,
      );
    }
    //
  }
}
