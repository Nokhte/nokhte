import 'package:flutter/material.dart';

class NokhtePainter extends CustomPainter {
  final Offset nokhteCoordinates;
  final Offset blueDotCoordinates;

  NokhtePainter({
    required this.nokhteCoordinates,
    required this.blueDotCoordinates,
  });

  drawNokhte(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;

    canvas.drawCircle(nokhteCoordinates, 14.0, paint);
  }

  drawBlue(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF4CD7FF),
          Color(0xFF6AEAB9),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: blueDotCoordinates, radius: 14.0));

    canvas.drawCircle(
      // nokhteCoordinates,
      blueDotCoordinates,
      14.0,
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawBlue(canvas, size);
    drawNokhte(canvas, size);
  }

  @override
  bool shouldRepaint(NokhtePainter oldDelegate) {
    return true;
  }
}
