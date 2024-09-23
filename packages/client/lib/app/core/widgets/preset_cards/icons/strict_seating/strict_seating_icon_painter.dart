import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class StrictSeatingIconPainter extends CustomPainter with BaseIconPainter {
  final double containerSize;
  final Offset top, right, bottom, left;
  final double masterOpacity;
  final bool showText;

  StrictSeatingIconPainter({
    required this.masterOpacity,
    required this.top,
    required this.right,
    required this.bottom,
    required this.left,
    required this.containerSize,
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

    final lineScalar = scalar * .012;

    final subCircleRad = scalar * .06;

    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(masterOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = scalar * .03;
    canvas.drawCircle(center, circleRad, paint);

    final t = Offset(top.dx * lineScalar, top.dy * lineScalar);
    final r = Offset(right.dx * lineScalar, right.dy * lineScalar);
    final b = Offset(bottom.dx * lineScalar, bottom.dy * lineScalar);
    final l = Offset(left.dx * lineScalar, left.dy * lineScalar);

    final Offset baseTop = Offset(center.dx + t.dx, center.dy + t.dy);
    final Offset baseRight = Offset(center.dx + r.dx, center.dy + r.dy);
    final Offset baseBottom = Offset(center.dx + b.dx, center.dy + b.dy);
    final Offset baseLeft = Offset(center.dx + l.dx, center.dy + l.dy);

    final Paint other = Paint()
      ..color = Colors.white.withOpacity(masterOpacity);
    canvas.drawCircle(baseTop, subCircleRad, other);
    canvas.drawCircle(baseRight, subCircleRad, other);
    canvas.drawCircle(baseBottom, subCircleRad, other);
    canvas.drawCircle(baseLeft, subCircleRad, other);

    final Paint paint1 = Paint()
      ..color = Colors.white.withOpacity(masterOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(baseTop, baseRight, paint1);
    canvas.drawLine(baseRight, baseBottom, paint1);
    canvas.drawLine(baseBottom, baseLeft, paint1);
    canvas.drawLine(baseLeft, baseTop, paint1);
    if (showText) {
      paintText(canvas, center, 'Notes', containerSize, masterOpacity);
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
