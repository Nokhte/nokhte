import 'package:flutter/material.dart';

class FlexibleSeatingIconPainter extends CustomPainter {
  final double containerSize;
  final double o1, o2, o3;

  FlexibleSeatingIconPainter({
    required this.o1,
    required this.o2,
    required this.o3,
    required this.containerSize,
  });

  getPaint(double opacity, double strokeScalar) => Paint()
    ..color = Colors.white.withOpacity(opacity)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = strokeScalar;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final scalar = size.height;
    final circleRad = scalar * .45;

    List initialXOffsets = [3, 7, 3];
    initialXOffsets = initialXOffsets.map((e) => e * (scalar * .02)).toList();

    double initialYOffset = 5 * (scalar * .02);

    double arrowDistance = 5 * (scalar * .02);

    final Paint circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = scalar * .03;
    canvas.drawCircle(center, circleRad, circlePaint);

    final strokeScalar = scalar * .03;

    final a1p1 =
        Offset(center.dx + initialXOffsets[0], center.dy - initialYOffset);
    final a1p2 = Offset(center.dx + initialXOffsets[1], center.dy);
    final a1p3 =
        Offset(center.dx + initialXOffsets[2], center.dy + initialYOffset);
    canvas.drawLine(a1p1, a1p2, getPaint(o1, strokeScalar));
    canvas.drawLine(a1p2, a1p3, getPaint(o1, strokeScalar));

    final a2p1 = Offset(a1p1.dx + arrowDistance, a1p1.dy);
    final a2p2 = Offset(a1p2.dx + arrowDistance, a1p2.dy);
    final a2p3 = Offset(a1p3.dx + arrowDistance, a1p3.dy);
    canvas.drawLine(a2p1, a2p2, getPaint(o2, strokeScalar));
    canvas.drawLine(a2p2, a2p3, getPaint(o2, strokeScalar));

    final a3p1 = Offset(a2p1.dx + arrowDistance, a2p1.dy);
    final a3p2 = Offset(a2p2.dx + arrowDistance, a2p2.dy);
    final a3p3 = Offset(a2p3.dx + arrowDistance, a2p3.dy);
    canvas.drawLine(a3p1, a3p2, getPaint(o3, strokeScalar));
    canvas.drawLine(a3p2, a3p3, getPaint(o3, strokeScalar));

    final a4p1 =
        Offset(center.dx - initialXOffsets[0], center.dy - initialYOffset);
    final a4p2 = Offset(center.dx - initialXOffsets[1], center.dy);
    final a4p3 =
        Offset(center.dx - initialXOffsets[2], center.dy + initialYOffset);

    canvas.drawLine(a4p1, a4p2, getPaint(o1, strokeScalar));
    canvas.drawLine(a4p2, a4p3, getPaint(o1, strokeScalar));

    final a5p1 = Offset(a4p1.dx - arrowDistance, a4p1.dy);
    final a5p2 = Offset(a4p2.dx - arrowDistance, a4p2.dy);
    final a5p3 = Offset(a4p3.dx - arrowDistance, a4p3.dy);

    canvas.drawLine(a5p1, a5p2, getPaint(o2, strokeScalar));
    canvas.drawLine(a5p2, a5p3, getPaint(o2, strokeScalar));

    final a6p1 = Offset(a5p1.dx - arrowDistance, a5p1.dy);
    final a6p2 = Offset(a5p2.dx - arrowDistance, a5p2.dy);
    final a6p3 = Offset(a5p3.dx - arrowDistance, a5p3.dy);

    canvas.drawLine(a6p1, a6p2, getPaint(o3, strokeScalar));
    canvas.drawLine(a6p2, a6p3, getPaint(o3, strokeScalar));
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
