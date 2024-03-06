import 'package:flutter/material.dart';
// import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TouchRipplePainter extends CustomPainter {
  final OpacityAndRadius firstCircle, secondCircle, thirdCircle;
  final Offset position;

  TouchRipplePainter({
    required this.firstCircle,
    required this.secondCircle,
    required this.thirdCircle,
    required this.position,
  });

  drawCircle(
    Canvas canvas,
    Size size,
    Offset center, {
    required double circleRadius,
    required double circleOpacity,
  }) {
    Paint circlePaint = Paint()
      ..color = Colors.white.withOpacity(circleOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(center, circleRadius, circlePaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // final center = Offset(
    //   size.width.half(),
    //   size.height.half(),
    // );
    drawCircle(
      canvas,
      size,
      position,
      circleOpacity: firstCircle.opacity,
      circleRadius: firstCircle.radius,
    );
    drawCircle(
      canvas,
      size,
      position,
      circleOpacity: secondCircle.opacity,
      circleRadius: secondCircle.radius,
    );
    drawCircle(
      canvas,
      size,
      position,
      circleOpacity: thirdCircle.opacity,
      circleRadius: thirdCircle.radius,
    );
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
