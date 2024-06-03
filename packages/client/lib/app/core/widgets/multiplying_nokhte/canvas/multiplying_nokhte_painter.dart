import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
// import 'package:nokhte/app/core/widgets/widgets.dart';

class MultiplyingNokhtePainter extends CustomPainter {
  final List<Offset> circleOffsets;
  final List<List<Color>> gradients;
  final List<String> symbols;
  final List<double> radii;
  final double textOpacity;

  MultiplyingNokhtePainter({
    required this.circleOffsets,
    required this.gradients,
    required this.symbols,
    required this.radii,
    required this.textOpacity,
  });

  drawNokhte(
    Canvas canvas,
    Size size,
    Offset center,
    List<Color> gradient,
    String symbol,
    double radius,
    int i,
  ) {
    final Rect circleBounds = Rect.fromCircle(center: center, radius: radius);
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: gradient,
        stops: const [0, 1],
      ).createShader(circleBounds);
    canvas.drawCircle(center, radius, paint);
    if (radius.isGreaterThan(20)) {
      final innerCircleStyle = GoogleFonts.jost(
        color: Colors.white,
        fontSize: 30.0,
      );
      final innerCircleSpan = TextSpan(text: symbol, style: innerCircleStyle);
      final innertextPainter = TextPainter(
        text: innerCircleSpan,
        textDirection: TextDirection.ltr,
      );
      innertextPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final innerCircleDx = (center.dx - innertextPainter.width) + 8;
      final innerCircleDy = center.dy - 22;
      innertextPainter.paint(canvas, Offset(innerCircleDx, innerCircleDy));
      //
      if (i == 1) {
        final style = GoogleFonts.jost(
          color: Colors.white.withOpacity(textOpacity),
          fontSize: 25.0,
        );
        final nextToCircleSpan = TextSpan(text: "4.99/month", style: style);
        final nextToCircleTextPainter = TextPainter(
          text: nextToCircleSpan,
          textDirection: TextDirection.ltr,
        );
        nextToCircleTextPainter.layout(
          minWidth: 0,
          maxWidth: size.width,
        );
        final xCenter = (center.dx - nextToCircleTextPainter.width) + 65;
        final yCenter = center.dy - 85;
        nextToCircleTextPainter.paint(canvas, Offset(xCenter, yCenter));
      }
      if (i == 2) {
        final style = GoogleFonts.jost(
          color: Colors.white.withOpacity(textOpacity),
          fontSize: 25.0,
        );
        final nextToCircleSpan = TextSpan(text: "Cancel", style: style);
        final nextToCircleTextPainter = TextPainter(
          text: nextToCircleSpan,
          textDirection: TextDirection.ltr,
        );
        nextToCircleTextPainter.layout(
          minWidth: 0,
          maxWidth: size.width,
        );
        final xCenter = (center.dx + nextToCircleTextPainter.width) - 110;
        final yCenter = center.dy + 50;
        nextToCircleTextPainter.paint(canvas, Offset(xCenter, yCenter));
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < circleOffsets.length; i++) {
      final center = Offset(
        (size.width / 2) + circleOffsets[i].dx,
        (size.height / 3) + circleOffsets[i].dy, // 2.1 rlugh
      );
      drawNokhte(
        canvas,
        size,
        center,
        gradients[i],
        symbols[i],
        radii[i],
        i,
      );
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
