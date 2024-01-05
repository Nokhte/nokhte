import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:touchable/touchable.dart';

class CrossPainter extends CustomPainter {
  final BuildContext context;
  Function onTap;
  Path path;
  Rect pathBounds;
  late double height;
  late double width;
  late Paint myPaint;
  ColorsAndStops crossGradient;
  List<CircleInformation> circleInformation;

  CrossPainter(
    this.context,
    this.path,
    this.pathBounds,
    Size size, {
    required this.onTap,
    required this.circleInformation,
    required this.crossGradient,
  });

  paintCross(TouchyCanvas canvas, Size size) {
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
    canvas.drawPath(path, crossPaint, onTapDown: (details) {
      onTap();
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    final touchableCanvas = TouchyCanvas(context, canvas);
    paintCross(touchableCanvas, size);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) => true;
}
