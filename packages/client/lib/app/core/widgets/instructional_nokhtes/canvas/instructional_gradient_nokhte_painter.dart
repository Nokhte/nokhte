import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionalGradientNokhtePainter extends CustomPainter {
  final Offset offsets;
  final double radius;
  final List<Color> colors;
  final List<double> stops;
  final bool textOnTop;
  final String text;
  final double textOpacity;

  InstructionalGradientNokhtePainter({
    required this.offsets,
    required this.radius,
    required this.text,
    required this.colors,
    required this.stops,
    required this.textOpacity,
    required this.textOnTop,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      offsets.dx,
      offsets.dy,
    );
    final rect = Rect.fromCircle(center: center, radius: radius);
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        stops: stops,
        // begin: Alignment.bottomCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);
    final textSpan = TextSpan(
      text: text,
      style: GoogleFonts.jost(
        fontSize: 20,
        // fontWeight: FontWeight.w300,
        color: Colors.white.withOpacity(textOpacity),
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
          (center.dy - textPainter.height / 2) +
              (textOnTop
                  ? -textPainter.height * 1.5
                  : textPainter.height * 1.5),
        ));
    rotate(canvas, center.dx, center.dy, 0.785398);
    canvas.drawCircle(center, radius, paint);
  }

  void rotate(Canvas canvas, double cx, double cy, double angle) {
    canvas.translate(cx, cy);
    canvas.rotate(angle);
    canvas.translate(-cx, -cy);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
