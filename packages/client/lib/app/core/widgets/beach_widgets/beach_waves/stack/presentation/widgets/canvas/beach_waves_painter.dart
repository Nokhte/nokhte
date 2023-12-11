import 'package:flutter/material.dart';

class BeachWavesPainter extends CustomPainter {
  final double waterValue;
  final List<Color> colorsList;
  final List<double> stopsList;

  BeachWavesPainter({
    required this.waterValue,
    required this.colorsList,
    required this.stopsList,
  });

  paintSand(Canvas canvas, Size size) {
    final sandGrandient = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFD2B48C),
          Color(0xFF8B5E3C),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(
          Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25));

    canvas.drawRect(Offset.zero & size, sandGrandient);
    //
  }

  paintWater(Canvas canvas, Size size) {
    const waveCount = 3;
    const waveAmplitude = 20.0;

    final waveGradient = LinearGradient(
      colors: colorsList,
      stops: stopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final waterPaint = Paint()
      ..shader = waveGradient
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final phase = waterValue;

    for (int i = 0; i < waveCount; i++) {
      final waveOffset = size.height / (waveCount + 1) * (i + 1);
      final yOffset = phase * 3;
      final path = Path()
        ..moveTo(0, waveOffset + yOffset)
        ..cubicTo(
          size.width / 3,
          waveOffset + yOffset - waveAmplitude / 2,
          2 * size.width / 3,
          waveOffset + yOffset + waveAmplitude / 2,
          size.width,
          waveOffset + yOffset,
        )
        ..lineTo(size.width, 0)
        ..lineTo(0, 0)
        ..close();
      canvas.drawPath(path, waterPaint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintSand(canvas, size);
    paintWater(canvas, size);
  }

  @override
  bool shouldRepaint(BeachWavesPainter oldDelegate) {
    return true;
  }
}
