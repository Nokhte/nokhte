import 'package:flutter/material.dart';

class GestureCrossPainter extends CustomPainter {
  Path path;
  double centerCircleAnimationConstant;
  Rect pathBounds;
  late double height;
  late double width;
  late Paint myPaint;
  Color firstGradientColor;
  Color secondGradientColor;

  GestureCrossPainter(
    this.path,
    Size size,
    this.pathBounds, {
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.centerCircleAnimationConstant,
  }) {
    height = pathBounds.height;
    width = pathBounds.width;
    myPaint = Paint()
      ..shader = RadialGradient(
          radius: 1,
          center: Alignment(
            0.0,
            1.0 - ((height * .3) / height),
          ),
          colors: [
            firstGradientColor,
            secondGradientColor,
          ],
          stops: const [
            -.5,
            2,
          ]).createShader(
        pathBounds,
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, myPaint);
    //
    const circleRadius = 7.0; // Adjust the radius as needed
    final circlePaint = Paint()..color = Colors.white;
    final centerX = width / 2;
    final centerY = (height - circleRadius * 2) -
        centerCircleAnimationConstant; // Position it near the bottom

    canvas.drawCircle(Offset(centerX, centerY), circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
