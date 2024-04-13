import 'package:flutter/material.dart';

class CenterInstructionalNokhtePainter extends CustomPainter {
  final Offset offsets;
  final double radii;

  CenterInstructionalNokhtePainter({
    required this.offsets,
    required this.radii,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      offsets.dx,
      offsets.dy,
    );
    Paint paint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radii, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
