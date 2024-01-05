import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:touchable/touchable.dart';

class GradientCrossNokhtePainter extends CustomPainter {
  final BuildContext context;
  final Function onTapDown;
  final List<Offset> offsets;
  final List<List<Color>> gradients;
  final List<List<double>> stops;

  GradientCrossNokhtePainter({
    required this.context,
    required this.offsets,
    required this.gradients,
    required this.stops,
    required this.onTapDown,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
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
      touchyCanvas.drawCircle(center, radius, paint,
          onTapDown: (details) => onTapDown());
    }
  }

  @override
  bool shouldRepaint(GradientCrossNokhtePainter oldDelegate) => true;
}
