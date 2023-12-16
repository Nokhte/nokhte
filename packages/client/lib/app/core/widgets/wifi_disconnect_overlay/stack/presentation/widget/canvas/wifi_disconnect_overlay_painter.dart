import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class WifiDisconnectOverlayPainter extends CustomPainter {
  final OpacityAndRadius circle,
      firstArc,
      secondArc,
      thirdArc,
      firstCircleOutline,
      secondCircleOutline,
      thirdCircleOutline;

  WifiDisconnectOverlayPainter({
    required this.circle,
    required this.firstArc,
    required this.secondArc,
    required this.thirdArc,
    required this.firstCircleOutline,
    required this.secondCircleOutline,
    required this.thirdCircleOutline,
  });

  drawArc(
    Canvas canvas,
    Size size,
    Offset center, {
    required double arcRadius,
    required double circleRadius,
    required double arcOpacity,
    required double circleOpacity,
  }) {
    Paint arcPaint = Paint()
      ..color = Colors.white.withOpacity(arcOpacity)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: arcRadius - 1),
      pi + .83,
      (pi / 6) + 1,
      false,
      arcPaint,
    );

    Paint circlePaint = Paint()
      ..color = Colors.white.withOpacity(circleOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(center, circleRadius, circlePaint);
  }

  drawCenterCircle(
      Canvas canvas, Size size, double radius, double opacity, Offset center) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(circle.opacity);
    canvas.drawCircle(center, circle.radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    drawArc(
      canvas,
      size,
      center,
      arcOpacity: firstArc.opacity,
      arcRadius: firstArc.radius,
      circleOpacity: firstCircleOutline.opacity,
      circleRadius: firstCircleOutline.radius,
    );
    drawArc(
      canvas,
      size,
      center,
      arcOpacity: secondArc.opacity,
      arcRadius: secondArc.radius,
      circleOpacity: secondCircleOutline.opacity,
      circleRadius: secondCircleOutline.radius,
    );
    drawArc(
      canvas,
      size,
      center,
      arcOpacity: thirdArc.opacity,
      arcRadius: thirdArc.radius,
      circleOpacity: thirdCircleOutline.opacity,
      circleRadius: thirdCircleOutline.radius,
    );
    drawCenterCircle(canvas, size, circle.radius, circle.opacity, center);
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return true;
  }
}
