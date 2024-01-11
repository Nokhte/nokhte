import 'package:flutter/material.dart';

class WaitingTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5.0;

    final double centerX = (size.width / 2);
    final double centerY = (size.height / 2) - (size.height * .125);

    const double lineLengthPercentage = 0.11;

    final double minDimension =
        size.width < size.height ? size.width : size.height;
    final double lineLength = minDimension * lineLengthPercentage;

    final double lineStartY = centerY - (lineLength / 2);
    final double lineEndY = centerY + (lineLength / 2);

    canvas.drawLine(
      Offset(centerX * 1.11, lineStartY),
      Offset(centerX * 1.11, lineEndY),
      paint,
    );
  }

  @override
  bool shouldRepaint(WaitingTextPainter oldDelegate) => true;
}
