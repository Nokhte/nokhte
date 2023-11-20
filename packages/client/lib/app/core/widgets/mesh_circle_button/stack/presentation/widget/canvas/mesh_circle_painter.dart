import 'package:flutter/material.dart';

class MeshCirclePainter extends CustomPainter {
  Path path;
  late Paint myPaint;
  late Paint theGlowPaint;
  Color firstGradientColor;
  Color secondGradientColor;
  Color glowColor;
  double glowOpacity;

  MeshCirclePainter(
    this.path,
    Size size, {
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.glowColor,
    required this.glowOpacity,
  }) {
    path.getBounds();
    myPaint = Paint()
      ..shader = RadialGradient(colors: [
        firstGradientColor,
        secondGradientColor,
      ], stops: const [
        0,
        1.8,
      ]).createShader(
        path.getBounds(),
      );

    myPaint.style = PaintingStyle.stroke;
    myPaint.strokeWidth = 5.0;
    myPaint.color = Colors.white;

    theGlowPaint = Paint();
    if (glowOpacity != 0) {
      theGlowPaint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);
      theGlowPaint.color = glowColor.withOpacity(glowOpacity);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, theGlowPaint);
    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(MeshCirclePainter oldDelegate) => true;
}
