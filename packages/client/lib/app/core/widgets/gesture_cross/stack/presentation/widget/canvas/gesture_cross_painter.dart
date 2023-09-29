import 'package:flutter/material.dart';

class GestureCrossPainter extends CustomPainter {
  Path path;
  late Paint myPaint;
  Color firstGradientColor;
  Color secondGradientColor;

  GestureCrossPainter(
    this.path,
    Size size, {
    required this.firstGradientColor,
    required this.secondGradientColor,
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
  }

  @override
  void paint(Canvas canvas, Size size) => canvas.drawPath(path, myPaint);

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
