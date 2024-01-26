import 'package:flutter/material.dart';

class AudioClipPlatformPainter extends CustomPainter {
  Path path;
  Rect pathBounds;
  List<Color> platformGradColors;
  List<Color> circleColors;
  List<double> circleVertOffsets;
  late double height;
  late double width;
  late Paint myPaint;

  AudioClipPlatformPainter({
    required this.path,
    required this.pathBounds,
    required this.platformGradColors,
    required this.circleColors,
    required this.circleVertOffsets,
  }) {
    height = pathBounds.height;
    width = pathBounds.width;
    myPaint = Paint()
      ..shader = RadialGradient(
          radius: 1,
          colors: platformGradColors,
          stops: const [-.5, 2]).createShader(
        pathBounds,
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, myPaint);
    const circleRadius = 5.5;

    final leftCircleX = (width / 2) - 23;
    final leftCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets.first;
    final leftPaint = Paint()..color = circleColors.first;

    final centerCircleX = width / 2;
    final centerCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[1];
    final centerPaint = Paint()..color = circleColors[1];

    final rightCircleX = (width / 2) + 23;
    final rightCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[2];
    final rightPaint = Paint()..color = circleColors[2];

    canvas.drawCircle(
        Offset(leftCircleX, leftCircleY), circleRadius, leftPaint);
    canvas.drawCircle(
        Offset(centerCircleX, centerCircleY), circleRadius, centerPaint);
    canvas.drawCircle(
        Offset(rightCircleX, rightCircleY), circleRadius, rightPaint);
  }

  @override
  bool shouldRepaint(AudioClipPlatformPainter oldDelegate) => true;
}
