import 'package:flutter/material.dart';

class BeachHorizonWaterPainter extends CustomPainter {
  final List<double> stopsList;
  final List<Color> colorsList;

  BeachHorizonWaterPainter({
    required this.colorsList,
    required this.stopsList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final waveGradient = LinearGradient(
      colors: colorsList,
      stops: stopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final waterPaint = Paint()
      ..shader = waveGradient.createShader(
        Rect.fromPoints(
          const Offset(0, 0),
          Offset(size.width, size.height),
        ),
      );
    final rect = Rect.fromPoints(
      const Offset(0, 0),
      Offset(size.width, size.height),
    );

    canvas.drawRect(rect, waterPaint);
  }

  @override
  bool shouldRepaint(BeachHorizonWaterPainter oldDelegate) {
    return oldDelegate != this;
  }
}
