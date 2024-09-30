import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin BaseIconPainter {
  paintText(Canvas canvas, Offset center, String text, double sizeScalar,
      double opacity) {
    final textSpan = TextSpan(
      text: text,
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
}
