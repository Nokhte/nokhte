import 'package:flutter/material.dart';

class InstructionalGradientNokhtePainter extends CustomPainter {
  final Offset offsets;
  final double radius;
  final double borderRadius;
  final List<Color> colors;
  final List<double> stops;

  InstructionalGradientNokhtePainter({
    required this.offsets,
    required this.radius,
    required this.borderRadius,
    required this.colors,
    required this.stops,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      offsets.dx,
      offsets.dy,
    );
    final rect = Rect.fromCircle(center: center, radius: radius);
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        stops: stops,
        // begin: Alignment.bottomCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);
    // canvas.rotate(.785398);
    rotate(canvas, center.dx, center.dy, 0.785398);
    canvas.drawRRect(rrect, paint);
  }

  void rotate(Canvas canvas, double cx, double cy, double angle) {
    canvas.translate(cx, cy);
    canvas.rotate(angle);
    canvas.translate(-cx, -cy);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
