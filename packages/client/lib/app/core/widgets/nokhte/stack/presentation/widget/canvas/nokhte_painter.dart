import 'package:flutter/material.dart';

class NokhtePainter extends CustomPainter {
  final Offset nokhteCoordinates;

  NokhtePainter({
    required this.nokhteCoordinates,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    canvas.drawCircle(nokhteCoordinates, 20.0, paint);
  }

  @override
  bool shouldRepaint(NokhtePainter oldDelegate) {
    return nokhteCoordinates != oldDelegate.nokhteCoordinates;
  }
}
