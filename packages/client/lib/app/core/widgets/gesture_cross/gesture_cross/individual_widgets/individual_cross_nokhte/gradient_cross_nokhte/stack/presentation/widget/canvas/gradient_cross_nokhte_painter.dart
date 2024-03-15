import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/gesture_cross/stack/types/gradient_nokhte_information.dart';

class GradientCrossNokhtePainter extends CustomPainter {
  final List<GradientNokhteInformation> info;

  GradientCrossNokhtePainter(this.info);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < info.length; i++) {
      const radius = 4.50;
      final center = Offset(
        size.width.half() - info[i].offsets.dx,
        size.height.half() - info[i].offsets.dy,
      );
      final Rect circleBounds = Rect.fromCircle(center: center, radius: radius);
      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: info[i].colors,
          stops: info[i].stops,
        ).createShader(circleBounds);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(GradientCrossNokhtePainter oldDelegate) => true;
}
