import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';

class GradientCrossNokhtePainter extends CustomPainter {
  final BuildContext context;
  final List<Offset> offsets;
  final List<List<Color>> gradients;
  final List<List<double>> stops;

  GradientCrossNokhtePainter({
    required this.context,
    required this.offsets,
    required this.gradients,
    required this.stops,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offsets.length; i++) {
      const radius = 4.50;
      final center = Offset(
        size.width.half() - offsets[i].dx,
        size.height.half() - offsets[i].dy,
      );
      final Rect circleBounds = Rect.fromCircle(center: center, radius: radius);
      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradients[i],
          stops: stops[i],
        ).createShader(circleBounds);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(GradientCrossNokhtePainter oldDelegate) => true;
}
