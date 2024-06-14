import 'package:flutter/material.dart';

class StrictSeatingIconPainter extends CustomPainter {
  final Offset top, right, bottom, left;

  StrictSeatingIconPainter({
    required this.top,
    required this.right,
    required this.bottom,
    required this.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2) + 50,
    );
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, 30, paint);

    final t = Offset(top.dx * .8, top.dy * .8);
    final r = Offset(right.dx * .8, right.dy * .8);
    final b = Offset(bottom.dx * .8, bottom.dy * .8);
    final l = Offset(left.dx * .8, left.dy * .8);

    final Offset baseTop = Offset(center.dx + t.dx, center.dy + t.dy);
    final Offset baseRight = Offset(center.dx + r.dx, center.dy + r.dy);
    final Offset baseBottom = Offset(center.dx + b.dx, center.dy + b.dy);
    final Offset baseLeft = Offset(center.dx + l.dx, center.dy + l.dy);

    final Paint other = Paint()..color = Colors.white;
    canvas.drawCircle(baseTop, 3, other);
    canvas.drawCircle(baseRight, 3, other);
    canvas.drawCircle(baseBottom, 3, other);
    canvas.drawCircle(baseLeft, 3, other);

    final Paint paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(baseTop, baseRight, paint1);
    canvas.drawLine(baseRight, baseBottom, paint1);
    canvas.drawLine(baseBottom, baseLeft, paint1);
    canvas.drawLine(baseLeft, baseTop, paint1);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
