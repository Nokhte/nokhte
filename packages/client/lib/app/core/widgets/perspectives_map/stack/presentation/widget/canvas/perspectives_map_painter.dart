import 'package:flutter/material.dart';

class PerspectivesMapPainter extends CustomPainter {
  Path path;
  Rect pathBounds;
  late double height;
  late double width;
  late Paint myPaint;
  List<Color> platformGradColors;
  List<Color> circleColors;
  List<double> circleVertOffsets;

  PerspectivesMapPainter(
    this.path,
    Size size,
    this.pathBounds, {
    required this.platformGradColors,
    required this.circleColors,
    required this.circleVertOffsets,
    // required this.centerCircleAnimationConstant,
  }) {
    height = pathBounds.height;
    width = pathBounds.width;
    myPaint = Paint()
      ..shader = RadialGradient(
          radius: 1,
          // center: const Alignment(
          //   0.0,
          //   0.0,
          //   // 1.0 - ((height) / height),
          // ),
          colors: platformGradColors,
          stops: const [-.5, 2]).createShader(
        pathBounds,
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, myPaint);
    const circleRadius = 5.5; // Adjust the radius as needed
    // leftMost
    final leftMostCircleX = (width / 2) - 45;
    final leftMostCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[0];
    final leftMostPaint = Paint()..color = circleColors[0];
    // left
    final leftCircleX = (width / 2) - 23;
    final leftCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[1];
    final leftPaint = Paint()..color = circleColors[1];
    // center
    final centerCircleX = width / 2;
    final centerCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[2];
    final centerPaint = Paint()..color = circleColors[2];
    // right
    final rightCircleX = (width / 2) + 23;
    final rightCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[3];
    final rightPaint = Paint()..color = circleColors[3];
    // rightMost
    final rightMostCircleX = (width / 2) + 45;
    final rightMostCircleY =
        ((height - circleRadius * 2) - 2) + circleVertOffsets[4];
    final rightMostPaint = Paint()..color = circleColors[4];
    //

    //
    canvas.drawCircle(
        Offset(leftMostCircleX, leftMostCircleY), circleRadius, leftMostPaint);
    canvas.drawCircle(
        Offset(leftCircleX, leftCircleY), circleRadius, leftPaint);
    canvas.drawCircle(
        Offset(centerCircleX, centerCircleY), circleRadius, centerPaint);
    canvas.drawCircle(
        Offset(rightCircleX, rightCircleY), circleRadius, rightPaint);
    canvas.drawCircle(Offset(rightMostCircleX, rightMostCircleY), circleRadius,
        rightMostPaint);
  }

  @override
  bool shouldRepaint(PerspectivesMapPainter oldDelegate) => true;
}
