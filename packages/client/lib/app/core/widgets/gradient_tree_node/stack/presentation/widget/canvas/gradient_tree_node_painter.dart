import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:touchable/touchable.dart';

class GradientTreeNodePainter extends CustomPainter {
  final NokhteGradient gradient;
  final BuildContext context;
  final Function onTap;

  GradientTreeNodePainter({
    required this.gradient,
    required this.context,
    required this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchableCanvas = TouchyCanvas(context, canvas);
    final center = Offset(size.width.half() + 5, size.height.half());

    const double radius = 25.0;

    final circleRect = Rect.fromCircle(center: center, radius: radius);

    final circleStrokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: gradient.colors,
        stops: gradient.stops,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(circleRect);

    touchableCanvas.drawCircle(
      center,
      radius,
      gradientPaint,
      onTapDown: (details) => onTap(),
    );

    touchableCanvas.drawCircle(
      center,
      radius,
      circleStrokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
