import 'package:flutter/material.dart';

class MeshCirclePainter extends CustomPainter {
  Path path;
  late Paint myPaint;
  Color firstGradientColor;
  Color secondGradientColor;

  MeshCirclePainter(
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

    myPaint.style = PaintingStyle.stroke;
    myPaint.strokeWidth = 5.0;
    myPaint.color = Colors.white;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(MeshCirclePainter oldDelegate) => true;
}
