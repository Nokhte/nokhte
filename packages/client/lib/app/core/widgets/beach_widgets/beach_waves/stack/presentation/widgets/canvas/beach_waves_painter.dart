import 'package:flutter/material.dart';

class BeachWavesPainter extends CustomPainter {
  final double waterValue;
  final Color firstGradientColor;
  final Color secondGradientColor;
  final Color thirdGradientColor;
  final Color fourthGradientColor;
  final Color fifthGradientColor;
  final Color sixthGradientColor;
  final Color seventhGradientColor;
  final Color eighthGradientColor;
  final double firstGradientStop;
  final double secondGradientStop;
  final double thirdGradientStop;
  final double fourthGradientStop;
  final double fifthGradientStop;
  final double sixthGradientStop;
  final double seventhGradientStop;
  final double eighthGradientStop;

  BeachWavesPainter({
    required this.waterValue,
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.thirdGradientColor,
    required this.fourthGradientColor,
    required this.fifthGradientColor,
    required this.sixthGradientColor,
    required this.seventhGradientColor,
    required this.eighthGradientColor,
    required this.firstGradientStop,
    required this.secondGradientStop,
    required this.thirdGradientStop,
    required this.fourthGradientStop,
    required this.fifthGradientStop,
    required this.sixthGradientStop,
    required this.seventhGradientStop,
    required this.eighthGradientStop,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const waveCount = 3;
    const waveAmplitude = 20.0;

    final waveGradient = LinearGradient(
      colors: [
        firstGradientColor,
        secondGradientColor,
        thirdGradientColor,
        fourthGradientColor,
        fifthGradientColor,
        sixthGradientColor,
        seventhGradientColor,
        eighthGradientColor,
      ],
      stops: [
        firstGradientStop,
        secondGradientStop,
        thirdGradientStop,
        fourthGradientStop,
        fifthGradientStop,
        sixthGradientStop,
        seventhGradientStop,
        eighthGradientStop,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final waterPaint = Paint()
      ..shader = waveGradient
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

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
  bool shouldRepaint(BeachWavesPainter oldDelegate) {
    return true;
  }
}
