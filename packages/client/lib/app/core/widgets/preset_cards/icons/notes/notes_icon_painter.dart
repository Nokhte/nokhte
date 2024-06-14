import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class NotesIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2) + 50,
    );
    final Paint circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, 30, circlePaint);

    const pencilSvg =
        "M3.02783 1.14502L1.46822 2.35805C0.656076 2.98972 0.506766 4.1588 1.13408 4.9743L29.8844 42.3497C29.9608 42.449 30.0551 42.5331 30.1625 42.5975L36.6666 46.4999C36.9582 46.6749 37.3115 46.3969 37.2101 46.0723L35.0544 39.1741C35.0184 39.059 34.9619 38.9513 34.8876 38.8563L5.64893 1.46912C5.0139 0.657118 3.84152 0.512151 3.02783 1.14502Z";

    Path path = parseSvgPathData(pencilSvg);

    var scalingMatrix = Float64List.fromList(
        [.8, 0, 0, 0, 0, .8, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]);
    path = path.transform(scalingMatrix);

    path = path.shift(Offset(center.dx - 15, center.dy - 18));
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
