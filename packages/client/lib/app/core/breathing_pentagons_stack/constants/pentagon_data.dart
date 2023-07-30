import 'package:flutter/material.dart';

class PentagonData {
  static double get radiusConstant => .01;

  static Paint getPentagonPaint(
    double centerX,
    double centerY,
    double radius,
    List<Color> colors,
  ) {
    final Paint paint1 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: radius,
        colors: colors,
      ).createShader(
        Rect.fromCircle(
          center: Offset(
            centerX * radiusConstant,
            centerY * radiusConstant,
          ),
          radius: radius + 3,
        ),
      );
    return paint1;
  }

  static double get pentagon1Angle => -0.3;
  static double get pentagon2Angle => 1.35;
  static double get pentagon3Angle => 1.75;
}
