import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/swipe_guide/swipe_guide.dart';

class SwipeGuidePainter extends CustomPainter {
  final List<double> opacities;
  final SwipeGuideOrientation orientation;

  SwipeGuidePainter({
    required this.opacities,
    required this.orientation,
  });
  getPaint(double opacity, double strokeScalar) => Paint()
    ..color = Colors.white.withOpacity(opacity)
    ..strokeCap = StrokeCap.square
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeScalar;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final scalar = size.height;

    List initialXOffsets = [3, 7, 3];
    initialXOffsets = initialXOffsets.map((e) => e * (scalar * .02)).toList();

    double initialYOffset = 5 * (scalar * .02);

    double arrowDistance = 5 * (scalar * .02);

    double strokeScalar = scalar * .01;
    if (orientation == SwipeGuideOrientation.left) {
      canvas.translate(center.dx, center.dy);
      canvas.rotate(pi);
      canvas.translate(-center.dx, -center.dy);
    } else if (orientation == SwipeGuideOrientation.top) {
      canvas.translate(center.dx, center.dy);
      canvas.rotate(pi * 1.5);
      canvas.translate(-center.dx, -center.dy);
    }

    for (int i = 0; i < 7; i++) {
      final startX = initialXOffsets[0];
      final middleX = initialXOffsets[1];
      final endX = initialXOffsets[2];

      final aP1 = Offset(
          center.dx + startX + i * arrowDistance, center.dy - initialYOffset);
      final aP2 = Offset(center.dx + middleX + i * arrowDistance, center.dy);
      final aP3 = Offset(
          center.dx + endX + i * arrowDistance, center.dy + initialYOffset);

      canvas.drawLine(aP1, aP2, getPaint(opacities[i], strokeScalar));
      canvas.drawLine(aP2, aP3, getPaint(opacities[i], strokeScalar));

      initialXOffsets = initialXOffsets.map((e) => e * 0.84).toList();
      initialYOffset *= 0.84;
      arrowDistance *= 0.95;
      strokeScalar *= 0.84;
    }
  }

  @override
  bool shouldRepaint(SwipeGuidePainter oldDelegate) => true;
}
