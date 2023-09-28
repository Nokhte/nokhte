import 'package:flutter/material.dart';

class GestureCrossPainter extends CustomPainter {
  Path path;
  late Paint myPaint;

  GestureCrossPainter(this.path) {
    myPaint = Paint();
    myPaint.color = Colors.green;
    myPaint.strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) => canvas.drawPath(path, myPaint);

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
