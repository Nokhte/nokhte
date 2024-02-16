import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class CrossPainter extends CustomPainter {
  Path path;
  Rect pathBounds;
  final bool showGlowAndOutline;
  late double height;
  late double width;
  late Paint myPaint;
  final double outlineOpacity;
  final double outlineBlur;
  ColorsAndStops crossGradient;
  List<CircleInformation> circleInformation;

  CrossPainter(
    this.path,
    this.pathBounds,
    Size size, {
    required this.circleInformation,
    required this.outlineBlur,
    required this.crossGradient,
    required this.showGlowAndOutline,
    required this.outlineOpacity,
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

    final crossOutline = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withOpacity(outlineOpacity);

    final crossGlow = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.white.withOpacity(outlineOpacity)
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, outlineBlur);
    if (showGlowAndOutline) {
      canvas.drawPath(path, crossGlow);
    }
    canvas.drawPath(path, crossPaint);
    if (showGlowAndOutline) {
      canvas.drawPath(path, crossOutline);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintCross(canvas, size);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) => true;
}
