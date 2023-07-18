import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaterPainter extends CustomPainter {
  final Animation<double> animation;

  WaterPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // Define the water properties
    const waveCount = 3; // Number of waves
    const waveAmplitude = 20.0; // Maximum vertical displacement of waves
    const wavePeriod = 1.0; // Duration of each wave cycle

    // Set up the paint for drawing the water waves
    // final wavePaint = Paint()..color = Colors.blue;
    const waveGradient = LinearGradient(
      colors: [
        Color(0xFF0B2431),
        Color(0xFF15484E),
        Color(0xFF176257),
        Color(0xFF1F8A7D),
        Color(0xFF29A48D),
      ],
      stops: [0, 0.1979, 0.4375, 0.5885, 0.7448],
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
    final phase = animation.value * 2.0 * math.pi;

    // Draw the water waves from the top
    for (int i = 0; i < waveCount; i++) {
      final waveOffset = size.height / (waveCount + 1) * (i + 1);
      final yOffset = -math.sin(phase + i * wavePeriod) * waveAmplitude;
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
  bool shouldRepaint(WaterPainter oldDelegate) {
    return true;
  }
}
