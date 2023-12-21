import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';

class SpotlightHaloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width.half(), size.height.half());
    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    canvas.drawCircle(center, 43.0, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
