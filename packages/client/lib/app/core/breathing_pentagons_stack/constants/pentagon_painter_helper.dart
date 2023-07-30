import 'package:flutter/material.dart';

class PentagonPainterHelper {
  static double get radiusConstant => .01;

  static Paint getRadialGradient(
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
}
