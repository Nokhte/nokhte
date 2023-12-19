import 'package:flutter/material.dart';

class GestureCrossPainter extends CustomPainter {
  Path path;
  double centerCircleAnimationConstant;
  double centerCircleOpacity;
  Rect pathBounds;
  late double height;
  late double width;
  late Paint myPaint;
  Color firstGradientColor;
  List<Color> upperCircleLinearGradient;
  Color secondGradientColor;

  GestureCrossPainter(
    this.path,
    Size size,
    this.pathBounds, {
    required this.firstGradientColor,
    required this.centerCircleOpacity,
    required this.secondGradientColor,
    required this.centerCircleAnimationConstant,
    required this.upperCircleLinearGradient,
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
    const circleRadius = 6.0;
    final lowerCirclePaint = Paint()
      ..color = Colors.white.withOpacity(centerCircleOpacity);
    final centerX = width / 2;
    final lowerCircleCenterY =
        (height - circleRadius * 2) - centerCircleAnimationConstant;
    final higherCircleCenterY = (height - circleRadius * 2) - 27;
    final higherCircleRect = Rect.fromCircle(
        center: Offset(centerX, higherCircleCenterY), radius: circleRadius);
    final upperCirclePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: upperCircleLinearGradient,
      ).createShader(higherCircleRect);

    canvas.drawCircle(
        Offset(centerX, lowerCircleCenterY), circleRadius, lowerCirclePaint);
    canvas.drawCircle(
        Offset(centerX, higherCircleCenterY), circleRadius, upperCirclePaint);
  }

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
