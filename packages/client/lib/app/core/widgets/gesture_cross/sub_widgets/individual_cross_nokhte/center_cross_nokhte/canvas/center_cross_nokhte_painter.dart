import 'package:flutter/material.dart';

class CenterCrossNokhtePainter extends CustomPainter {
  final Function onTap;
  final List<Offset> offsets;
  final List<double> radii;

  CenterCrossNokhtePainter({
    required this.offsets,
    required this.radii,
    required this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offsets.length; i++) {
      final center = Offset(
        offsets[i].dx,
        offsets[i].dy,
      );
      final paint = Paint()..color = Colors.white;
      canvas.drawCircle(center, radii[i], paint);
    }
  }

  @override
  bool shouldRepaint(CenterCrossNokhtePainter oldDelegate) => true;
}
