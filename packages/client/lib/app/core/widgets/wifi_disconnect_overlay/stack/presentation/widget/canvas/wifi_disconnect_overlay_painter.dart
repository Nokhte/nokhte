import 'dart:math';

import 'package:flutter/material.dart';

class WifiDisconnectOverlayPainter extends CustomPainter {
  final double circleRadius,
      circleOpacity,
      firstArcOpacity,
      secondArcOpacity,
      thirdArcOpacity;

  WifiDisconnectOverlayPainter({
    required this.circleRadius,
    required this.circleOpacity,
    required this.firstArcOpacity,
    required this.secondArcOpacity,
    required this.thirdArcOpacity,
  });

  drawArc(Canvas canvas, Size size, double radius, double opacity) {
    final center = Offset(size.width / 2, size.height / 2);
    Paint arcPaint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke; // Set the painting style to

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi + .83, // start angle in radians (330 degrees)
      (pi / 6) + 1, // sweep angle in radians (30 degrees)
      false,
      arcPaint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    drawArc(canvas, size, 15, firstArcOpacity);
    drawArc(canvas, size, 30, secondArcOpacity);
    drawArc(canvas, size, 45, thirdArcOpacity);

    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(circleOpacity);
    canvas.drawCircle(center, circleRadius, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return true;
  }
}
