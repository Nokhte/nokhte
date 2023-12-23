import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';

class ClockFacePainter extends CustomPainter {
  drawHourLines(Canvas canvas, Offset center, double radius) {
    double lineLength;
    final Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    for (int i = 0; i < 12; i++) {
      if (i % 3 == 0) {
        lineLength = 20.0;
      } else {
        lineLength = 15.0;
      }
      double angle = pi * 2 * (i / 12);
      double x1 = center.dx + cos(angle) * radius;
      double y1 = center.dy + sin(angle) * radius;
      double x2 = center.dx + cos(angle) * (radius - lineLength);
      double y2 = center.dy + sin(angle) * (radius - lineLength);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width.half(), size.height.half() - 130);
    final double radius = size.width * .4;
    drawHourLines(canvas, center, radius);
  }

  @override
  bool shouldRepaint(ClockFacePainter oldDelegate) => true;
}
