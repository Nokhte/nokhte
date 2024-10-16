import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesPainter extends CustomPainter {
  final double waterValue;
  final List<Color> colorsList;
  final List<double> stopsList;
  final bool shouldPaintSand;
  final SandTypes sandType;
  final bool shouldScrollAdjust;
  final double scrollPercentage;

  BeachWavesPainter({
    required this.waterValue,
    required this.colorsList,
    required this.stopsList,
    required this.shouldPaintSand,
    required this.sandType,
    required this.shouldScrollAdjust,
    required this.scrollPercentage,
  });

  adjustColors() {
    final newColors = <Color>[];
    for (int i = 0; i < colorsList.length; i++) {
      newColors.add(Color.lerp(colorsList[i],
          WaterColorsAndStops.invertedDeeperBlue[i].color, scrollPercentage)!);
    }
    return newColors;
  }

  double lerpDouble(double start, double end, double t) {
    return start + (end - start) * t;
  }

  adjustStops() {
    final newColors = <double>[];
    for (int i = 0; i < stopsList.length; i++) {
      newColors.add(lerpDouble(stopsList[i],
          WaterColorsAndStops.invertedDeeperBlue[i].stop, scrollPercentage));
    }
    return newColors;
  }

  paintSand(Canvas canvas, Size size, SandTypes sandType) {
    final sandGrandient = Paint();
    List<Color> colors = [];
    List<double> stops = [];
    switch (sandType) {
      case SandTypes.home:
        colors = const [
          Color(0xFFD2B48C),
          Color(0xFF8B5E3C),
        ];
        stops = [0, .3];
      case SandTypes.collaboration:
        colors = const [
          Color(0xFFFFE6C4),
          Color(0xFFFFBC78),
        ];
        stops = [0, .2];
    }
    sandGrandient.shader = LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    // break;
    canvas.drawRect(Offset.zero & size, sandGrandient);
  }

  paintWater(Canvas canvas, Size size) {
    const waveCount = 3;
    const waveAmplitude = 20.0;

    final waveGradient = LinearGradient(
      colors: shouldScrollAdjust ? adjustColors() : colorsList,
      stops: shouldScrollAdjust ? adjustStops() : stopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final waterPaint = Paint()
      ..shader = waveGradient
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final phase = waterValue + (scrollPercentage * 100);

    for (int i = 0; i < waveCount; i++) {
      final waveOffset = size.height / (waveCount + 1) * (i + 1);
      final yOffset = phase * 3;
      final path = Path()
        ..moveTo(0, waveOffset + yOffset)
        ..cubicTo(
          size.width / 3,
          waveOffset + yOffset - waveAmplitude.half(),
          2 * size.width / 3,
          waveOffset + yOffset + waveAmplitude.half(),
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
    if (shouldPaintSand) {
      paintSand(canvas, size, sandType);
    }
    paintWater(canvas, size);
  }

  @override
  bool shouldRepaint(BeachWavesPainter oldDelegate) {
    return true;
  }
}
