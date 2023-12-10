import 'package:flutter/material.dart';
import 'package:nokhte/app/core/constants/constants.dart';

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
      ..shader = LinearGradient(
        colors: Gradients.skyMint,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: blueDotCoordinates, radius: 14.0));

    canvas.drawCircle(
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
