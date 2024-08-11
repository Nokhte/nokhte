import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class HoldTimerIndicatorPainter extends CustomPainter {
  final double sweep;
  final List<ColorAndStop> grad;

  HoldTimerIndicatorPainter({
    required this.sweep,
    required this.grad,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width.half(), size.height.half() * 1);

    final rect = Rect.fromCircle(center: center, radius: 40);
    final paint = Paint()
      ..shader = LinearGradient(
        colors: grad.map((e) => e.color).toList(),
        stops: grad.map((e) => e.stop).toList(),
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);
    canvas.drawArc(rect, -pi / 2, sweep, true, paint);
  }

  @override
  bool shouldRepaint(HoldTimerIndicatorPainter oldDelegate) => true;
}
