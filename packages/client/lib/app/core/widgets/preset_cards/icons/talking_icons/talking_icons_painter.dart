import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalkingIconsPainter extends CustomPainter {
  final Color color;
  final bool showTheH;
  final double sizeScalar;
  final double opacity;
  final bool showText;

  TalkingIconsPainter({
    required this.color,
    required this.opacity,
    required this.showTheH,
    required this.sizeScalar,
    required this.showText,
  });

  paintText(Canvas canvas, Offset center) {
    final textSpan = TextSpan(
      text: 'Speaking',
      style: GoogleFonts.jost(
        fontSize: sizeScalar * .07,
        color: Colors.white.withOpacity(opacity),
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: double.infinity,
    );
    textPainter.paint(
        canvas,
        Offset(
          center.dx - textPainter.width / 2,
          (center.dy - textPainter.height / 2) + (textPainter.height * 1.7),
        ));
  }

  @override
  void paint(canvas, size) {
    final center = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final scalar = size.height;
    final strokeWidth = scalar * .03;

    final circleGlow = Paint()
      ..strokeWidth = scalar * .1
      ..color = color
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, scalar * .2);

    final circleRad = scalar * .45;

    canvas.drawCircle(center, circleRad, circleGlow);

    final Paint circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, circleRad, circlePaint);
    final textStyle = GoogleFonts.jost(
      color: Colors.white,
      fontSize: scalar * .6,
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

    if (showText) {
      paintText(canvas, center);
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
