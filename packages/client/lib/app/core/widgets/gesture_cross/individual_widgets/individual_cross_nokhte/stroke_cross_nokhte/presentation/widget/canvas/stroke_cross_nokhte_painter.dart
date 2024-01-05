import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:touchable/touchable.dart';

class StrokeCrossNokhtePainter extends CustomPainter {
  final List<Offset> offsets;
  final BuildContext context;
  final Function onTap;

  StrokeCrossNokhtePainter({
    required this.offsets,
    required this.context,
    required this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    for (int i = 0; i < offsets.length; i++) {
      const radius = 4.50;
      final center = Offset(
        size.width.half() - offsets[i].dx,
        size.height.half() - offsets[i].dy,
      );
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = Colors.white.withOpacity(.27);
      touchyCanvas.drawCircle(
        center,
        radius,
        paint,
        onTapDown: (details) => onTap(),
      );
    }
  }

  @override
  bool shouldRepaint(StrokeCrossNokhtePainter oldDelegate) => false;
}
