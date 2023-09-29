import 'package:flutter/material.dart';

class GestureCrossPainter extends CustomPainter {
  Path path;

  late Paint myPaint;

  GestureCrossPainter(this.path, Size size) {
    path.getBounds();
    myPaint = Paint()
      ..shader = RadialGradient(
          colors: [Color(0xFF0A98FF), Color(0x00FFFFFF)],
          stops: [0, 1.2]).createShader(
        path.getBounds(),
      );
    // myPaint.color = Colors.green.withOpacity(.5);
    // myPaint.strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) => canvas.drawPath(path, myPaint);

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
