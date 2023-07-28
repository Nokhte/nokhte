import 'package:flutter/material.dart';

class Interval {
  /// I think the goal of pentagonPaints is that it returns paint given
  /// colors which means it needs to accep
  static List<Paint> getPentagonPaints(
      List<List<Color>> intervalGradients, Size canvasSize) {
    final double centerX = canvasSize.width / 2;
    final double centerY = canvasSize.height / 2;
    final double radius = canvasSize.height * .04;

    List<Paint> returnPaintList = [];
    for (int i = 0; i < intervalGradients.length; i++) {
      final currentPaintGrad =
          getPentagonPaint(centerX, centerY, radius, intervalGradients[i]);
      returnPaintList.add(currentPaintGrad);
    }
    return returnPaintList;
  }

  static Paint getPentagonPaint(
    double centerX,
    double centerY,
    double radius,
    List<Color> gradientList, {
    double radiusConstant = .01,
  }) {
    final Paint paint1 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: radius,
        colors: gradientList,
      ).createShader(
        Rect.fromCircle(
          center: Offset(
            centerX * radiusConstant,
            centerY * radiusConstant,
          ),
          radius: radius,
        ),
      );
    return paint1;
  }
}
