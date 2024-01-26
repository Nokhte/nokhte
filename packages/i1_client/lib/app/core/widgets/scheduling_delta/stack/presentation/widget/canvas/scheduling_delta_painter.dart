import 'package:flutter/material.dart';

class SchedulingDeltaPainter extends CustomPainter {
  Path path;
  Color deltaColor;

  SchedulingDeltaPainter({
    required this.path,
    required this.deltaColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, Paint()..color = deltaColor);
  }

  @override
  bool shouldRepaint(SchedulingDeltaPainter oldDelegate) => true;
}
