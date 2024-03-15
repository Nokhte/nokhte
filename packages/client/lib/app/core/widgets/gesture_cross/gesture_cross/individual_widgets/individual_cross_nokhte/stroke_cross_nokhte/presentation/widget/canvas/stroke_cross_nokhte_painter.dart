import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';

class StrokeCrossNokhtePainter extends CustomPainter {
  final List<Offset> offsets;

  StrokeCrossNokhtePainter({
    required this.offsets,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offsets.length; i++) {
      const radius = 4.50;
      final center = Offset(
        size.width.half() - offsets[i].dx,
        size.height.half() - offsets[i].dy,
      );
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = Colors.white.withOpacity(.27);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(StrokeCrossNokhtePainter oldDelegate) => false;
}
