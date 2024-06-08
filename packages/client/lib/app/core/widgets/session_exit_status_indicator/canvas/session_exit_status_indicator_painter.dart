// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';

class SessionExitStatusIndicatorPainter extends CustomPainter {
  final double regularCircleRadius;
  final double stroke;
  final double percentage;
  final double opacity;
  final Size fullSize;

  SessionExitStatusIndicatorPainter({
    required this.regularCircleRadius,
    required this.stroke,
    required this.percentage,
    required this.opacity,
    required this.fullSize,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const mainCircleRadius = 1.0;
    final center = Offset(
      (size.width / 2),
      (size.height / 2),
    );
    if (regularCircleRadius != 50) {
      Paint mainPaint = Paint();
      mainPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = Colors.white;
      canvas.drawCircle(center, regularCircleRadius, mainPaint);
    } else {
      const double radius = 50;
      const color = Colors.white;
      final rect = Rect.fromCircle(center: center, radius: radius);

      const startAngle = -pi / 2;

      final double degree = (percentage * 360) / 100;
      final double radian = (degree / 180) * pi;

      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke;

      final mainPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = Colors.white.withOpacity(.2);

      canvas.drawCircle(center, regularCircleRadius, mainPaint);
      canvas.drawArc(rect, startAngle, radian, false, paint);

      final p1 = Offset(center.dx - 10, center.dy);
      final p2 = Offset(center.dx + 10, center.dy);
      final paint1 = Paint()
        ..color = Colors.white.withOpacity(opacity)
        ..strokeWidth = 1.5;
      canvas.drawLine(p1, p2, paint1);
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
