import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class CrossPainter extends CustomPainter {
  Path path;
  Rect pathBounds;
  late double height;
  late double width;
  late Paint myPaint;
  ColorsAndStops crossGradient;
  List<CircleInformation> circleInformation;

  CrossPainter(
    this.path,
    this.pathBounds,
    Size size, {
    required this.circleInformation,
    required this.crossGradient,
  });

  paintCross(Canvas canvas, Size size) {
    height = pathBounds.height;
    width = pathBounds.width;

    final crossPaint = Paint()
      ..shader = RadialGradient(
        radius: 1.4,
        colors: crossGradient.colors,
        stops: crossGradient.stops,
      ).createShader(
        pathBounds,
      );
    canvas.drawPath(path, crossPaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintCross(canvas, size);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) => true;
}
