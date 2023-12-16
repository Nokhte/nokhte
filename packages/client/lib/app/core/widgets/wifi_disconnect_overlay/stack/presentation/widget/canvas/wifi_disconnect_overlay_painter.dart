import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class WifiDisconnectOverlayPainter extends CustomPainter {
  final OpacityAndRadius circle, firstArc, secondArc, thirdArc;

  WifiDisconnectOverlayPainter({
    required this.circle,
    required this.firstArc,
    required this.secondArc,
    required this.thirdArc,
  });

  drawArc(
      Canvas canvas, Size size, double radius, double opacity, Offset center) {
    Paint arcPaint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 1),
      pi + .83,
      (pi / 6) + 1,
      false,
      arcPaint,
    );
    Paint circlePaint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(center, radius, circlePaint);
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
    drawArc(canvas, size, firstArc.radius, firstArc.opacity, center);
    drawArc(canvas, size, secondArc.radius, secondArc.opacity, center);
    drawArc(canvas, size, thirdArc.radius, thirdArc.opacity, center);
    drawCenterCircle(canvas, size, circle.radius, circle.opacity, center);
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return true;
  }
}
