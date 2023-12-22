import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:touchable/touchable.dart';

class GestureCrossPainter extends CustomPainter {
  final BuildContext context;
  Path path;
  Rect pathBounds;
  late double height;
  late double width;
  late Paint myPaint;
  ColorsAndStops crossGradient;
  List<CircleInformation> circleInformation;

  GestureCrossPainter(
    this.context,
    this.path,
    this.pathBounds,
    Size size, {
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
      print("hi you tapped $details");
    }, onTapUp: (details) {
      print("something");
    });
  }

  paintCircles(
    TouchyCanvas canvas,
    Size size,
    Offset center,
    double radius,
    List<CircleInformation> circleInformation,
  ) {
    for (final individualCircle in circleInformation) {
      Paint circlePaint = Paint();
      final circleY = (height) - individualCircle.offset.dy;
      final circleX = (center.dx) - individualCircle.offset.dx;
      final circleCenter = Offset(circleX, circleY);
      final Rect circleBounds =
          Rect.fromCircle(center: circleCenter, radius: radius);
      individualCircle.colorOrGradient.fold((color) {
        circlePaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
      }, (gradient) {
        circlePaint = Paint()
          ..shader = LinearGradient(
            begin: individualCircle.startingAlignment,
            end: individualCircle.endingAlignment,
            colors: gradient.colors,
            stops: gradient.stops,
          ).createShader(circleBounds);
      });
      canvas.drawCircle(Offset(circleX, circleY), radius, circlePaint,
          onTapDown: (details) {
        print("hi you tapped $details");
      }, onTapUp: (details) {
        print("something");
      });
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final touchableCanvas = TouchyCanvas(context, canvas);
    paintCross(touchableCanvas, size);
    final center = Offset(width.half(), height.half());
    const radius = 4.5;
    paintCircles(touchableCanvas, size, center, radius, circleInformation);
  }

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
