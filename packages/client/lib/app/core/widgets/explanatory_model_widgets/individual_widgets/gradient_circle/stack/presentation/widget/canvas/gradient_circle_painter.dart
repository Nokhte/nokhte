import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GradientCirclePainter extends CustomPainter {
  final ModelGradientOptions gradient;

  GradientCirclePainter({
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width.half(), size.height.half());
    const double radius = 25.0;
    final circleRect = Rect.fromCircle(center: center, radius: radius);
    final circleStrokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: gradient == ModelGradientOptions.collaborator
            ? ModelGradients.collaboratorGradient
            : ModelGradients.userGradient,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(circleRect);
    canvas.drawCircle(center, radius, gradientPaint);
    canvas.drawCircle(center, radius, circleStrokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
