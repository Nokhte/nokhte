/// breathing_pentagons_painter.dart
import 'dart:math';
import 'pentagon_colors.dart';
import 'package:flutter/material.dart';

class BreathingPentagonsPainter extends CustomPainter {
  final Animation<double> animation;
  BreathingPentagonsPainter({required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const double radius = 100.0; // You can adjust this as needed

    final Paint paint1 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.5315,
        colors: PentagonColors.firstPentagonRadGradient,
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    final Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.5315,
        colors: PentagonColors.secondPentagonRadGradient,
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    final Paint paint3 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.5315,
        colors: PentagonColors.thirdPentagonRadGradient,
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    final double scale = animation.value; // Scale animation value
    const double scalingConstant = 5.0;

    const double angle1 = 0.0; // Starting angle of pentagon 1
    const double angle2 = -24.5; // Rotate back to original angle
    const double angle3 = -47.5; // Rotate back to original angle

    // Draw pentagon 1
    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(angle1 + (scale * scalingConstant));
    canvas.scale(scale);
    drawPentagon(canvas, paint1);
    canvas.restore();

    // Draw pentagon 2
    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(angle2 + (scale * scalingConstant));
    canvas.scale(scale);
    drawPentagon(canvas, paint2);
    canvas.restore();

    // Draw pentagon 3
    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(angle3 + (scale * scalingConstant));
    canvas.scale(scale);
    drawPentagon(canvas, paint3);
    canvas.restore();
  }

  void drawPentagon(Canvas canvas, Paint paint) {
    const double sideLength = 100; // You can adjust this as needed
    const double rotation = 2 * pi / 5;
    final Path path = Path();

    for (int i = 0; i < 5; i++) {
      final double x = cos(i * rotation);
      final double y = sin(i * rotation);
      if (i == 0) {
        path.moveTo(x * sideLength, y * sideLength);
      } else {
        path.lineTo(x * sideLength, y * sideLength);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BreathingPentagonsPainter oldDelegate) => true;
}
