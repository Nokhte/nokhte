import 'package:flutter/material.dart';
import 'package:nokhte/app/core/constants/constants.dart';

class NokhtePainter extends CustomPainter {
  final Offset nokhteCoordinates;
  final Offset blueDotCoordinates;
  final double circleRadii;
  final bool isAboutToApparate;

  NokhtePainter({
    required this.nokhteCoordinates,
    required this.blueDotCoordinates,
    required this.circleRadii,
    required this.isAboutToApparate,
  });

  drawNokhte(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    canvas.drawCircle(nokhteCoordinates, circleRadii, paint);
  }

  drawBlue(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: Gradients.skyMint,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
          Rect.fromCircle(center: blueDotCoordinates, radius: circleRadii));
    canvas.drawCircle(
      blueDotCoordinates,
      circleRadii,
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (isAboutToApparate) {
      drawNokhte(canvas, size);
      drawBlue(canvas, size);
    } else {
      drawBlue(canvas, size);
      drawNokhte(canvas, size);
    }
  }

  @override
  bool shouldRepaint(NokhtePainter oldDelegate) {
    return true;
  }
}
