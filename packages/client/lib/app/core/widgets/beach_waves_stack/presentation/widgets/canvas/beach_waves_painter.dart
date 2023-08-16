import 'package:flutter/material.dart';

class BeachWavesPainter extends CustomPainter {
  final double waterValue;
  final Color firstGradientColor;
  final Color secondGradientColor;
  final Color thirdGradientColor;
  final Color fourthGradientColor;
  final Color fifthGradientColor;

  BeachWavesPainter({
    required this.waterValue,
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.thirdGradientColor,
    required this.fourthGradientColor,
    required this.fifthGradientColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the water properties
    const waveCount = 3; // Number of waves
    const waveAmplitude = 20.0; // Maximum vertical displacement of waves

    // Set up the paint for drawing the water waves
    // final wavePaint = Paint()..color = Colors.blue;
    final waveGradient = LinearGradient(
      colors: [
        firstGradientColor,
        secondGradientColor,
        thirdGradientColor,
        fourthGradientColor,
        fifthGradientColor,
      ],
      stops: const [0, 0.1979, 0.4375, 0.5885, 0.7448],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final waterPaint = Paint()
      ..shader = waveGradient
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Set up the paint for drawing the sand-looking gradient
    final sandGrandient = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFD2B48C), // Light sand color
          Color(0xFF8B5E3C), // Dark sand color
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(
          Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25));

    // Paint the sand-looking gradient at the bottom
    canvas.drawRect(Offset.zero & size, sandGrandient);

    // Calculate the current phase based on the animation value
    final phase = waterValue;

    // Draw the water waves from the top
    for (int i = 0; i < waveCount; i++) {
      final waveOffset = size.height / (waveCount + 1) * (i + 1);
      // final yOffset = -math.sin(phase + i * wavePeriod) * waveAmplitude;
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
