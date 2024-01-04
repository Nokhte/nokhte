import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';

class CenterCrossNokhtePainter extends CustomPainter {
  final List<Offset> offsets;
  final List<double> radii;

  CenterCrossNokhtePainter({
    required this.offsets,
    required this.radii,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offsets.length; i++) {
      final center = Offset(
        size.width.half() - offsets[i].dx,
        size.height.half() - offsets[i].dy,
      );
      final paint = Paint()..color = Colors.white;
      canvas.drawCircle(center, radii[i], paint);
    }
  }

  @override
  bool shouldRepaint(CenterCrossNokhtePainter oldDelegate) => true;
}
