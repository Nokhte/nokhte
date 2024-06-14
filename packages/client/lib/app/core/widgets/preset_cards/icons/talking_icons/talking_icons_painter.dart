import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalkingIconsPainter extends CustomPainter {
  final Color color;
  final bool showTheH;

  TalkingIconsPainter({required this.color, required this.showTheH});

  @override
  void paint(canvas, size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final circleGlow = Paint()
      ..strokeWidth = 5.0
      ..color = color
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(center, 33, circleGlow);

    final Paint circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, 30, circlePaint);
    final textStyle = GoogleFonts.jost(
      color: Colors.white,
      fontSize: size.height * .04,
    );

    final textSpan = TextSpan(
      text: showTheH ? 'H' : 'T',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);

    //
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
