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

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final scalar = size.height;
    final circleRad = scalar * .45;

    final Paint circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = scalar * .03;
    canvas.drawCircle(center, circleRad, circlePaint);

    final lineScalar = scalar * .014;

    final dx = scalar * .48;
    final dy = scalar * .48;

    canvas.scale(lineScalar, lineScalar);
    canvas.translate(dx, dy);

    final a1p1 = Offset(center.dx + 4, center.dy - 5);
    final a1p2 = Offset(center.dx + 10, center.dy);
    final a1p3 = Offset(center.dx + 4, center.dy + 5);
    final Paint a1Paint = Paint()
      ..color = Colors.white.withOpacity(o1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    canvas.drawLine(a1p1, a1p2, a1Paint);
    canvas.drawLine(a1p2, a1p3, a1Paint);

    final a2p1 = Offset(a1p1.dx + 7, a1p1.dy);
    final a2p2 = Offset(a1p2.dx + 7, a1p2.dy);
    final a2p3 = Offset(a1p3.dx + 7, a1p3.dy);
    final Paint a2Paint = Paint()
      ..color = Colors.white.withOpacity(o2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    canvas.drawLine(a2p1, a2p2, a2Paint);
    canvas.drawLine(a2p2, a2p3, a2Paint);

    final a3p1 = Offset(a2p1.dx + 7, a2p1.dy);
    final a3p2 = Offset(a2p2.dx + 7, a2p2.dy);
    final a3p3 = Offset(a2p3.dx + 7, a2p3.dy);
    final Paint a3Paint = Paint()
      ..color = Colors.white.withOpacity(o3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    canvas.drawLine(a3p1, a3p2, a3Paint);
    canvas.drawLine(a3p2, a3p3, a3Paint);

    final a4p1 = Offset(center.dx - 4, center.dy - 5);
    final a4p2 = Offset(center.dx - 10, center.dy);
    final a4p3 = Offset(center.dx - 4, center.dy + 5);
    final Paint a4Paint = Paint()
      ..color = Colors.white.withOpacity(o1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawLine(a4p1, a4p2, a4Paint);
    canvas.drawLine(a4p2, a4p3, a4Paint);

    final a5p1 = Offset(a4p1.dx - 7, a4p1.dy);
    final a5p2 = Offset(a4p2.dx - 7, a4p2.dy);
    final a5p3 = Offset(a4p3.dx - 7, a4p3.dy);
    final Paint a5Paint = Paint()
      ..color = Colors.white.withOpacity(o2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawLine(a5p1, a5p2, a5Paint);
    canvas.drawLine(a5p2, a5p3, a5Paint);

    final a6p1 = Offset(a5p1.dx - 7, a5p1.dy);
    final a6p2 = Offset(a5p2.dx - 7, a5p2.dy);
    final a6p3 = Offset(a5p3.dx - 7, a5p3.dy);
    final Paint a6Paint = Paint()
      ..color = Colors.white.withOpacity(o3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawLine(a6p1, a6p2, a6Paint);
    canvas.drawLine(a6p2, a6p3, a6Paint);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
