import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:path_drawing/path_drawing.dart';

class NotesIconPainter extends CustomPainter with BaseIconPainter {
  final double containerSize;
  final double angle, masterOpacity;
  final bool showText;

  NotesIconPainter({
    required this.masterOpacity,
    required this.containerSize,
    required this.angle,
    required this.showText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final scalar = size.height;

    final circleRad = scalar * .45;

    final strokeWidth = scalar * .03;

    final pencilScalar = scalar * .013;

    final pencilXTranslateScalar = scalar * .25;

    final pencilYTranslateScalar = scalar * .3;

    final Paint circlePaint = Paint()
      ..color = Colors.white.withOpacity(masterOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, circleRad, circlePaint);

    if (showText) {
      paintText(canvas, center, 'Notes', containerSize, masterOpacity);
    }
    canvas.rotate(angle);

    const pencilSvg =
        "M3.02783 1.14502L1.46822 2.35805C0.656076 2.98972 0.506766 4.1588 1.13408 4.9743L29.8844 42.3497C29.9608 42.449 30.0551 42.5331 30.1625 42.5975L36.6666 46.4999C36.9582 46.6749 37.3115 46.3969 37.2101 46.0723L35.0544 39.1741C35.0184 39.059 34.9619 38.9513 34.8876 38.8563L5.64893 1.46912C5.0139 0.657118 3.84152 0.512151 3.02783 1.14502Z";

    Path path = parseSvgPathData(pencilSvg);

    var scalingMatrix = Float64List.fromList(
        [pencilScalar, 0, 0, 0, 0, pencilScalar, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]);
    path = path.transform(scalingMatrix);

    path = path.shift(Offset(center.dx - pencilXTranslateScalar,
        center.dy - pencilYTranslateScalar));
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white.withOpacity(masterOpacity)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
