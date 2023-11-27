import 'package:flutter/material.dart';

class MeshCirclePainter extends CustomPainter {
  Path path;
  late Paint myPaint;
  late Paint theGlowPaint;
  double xScaleglow;
  double yGlowScale;
  double xGlowXTranslate;
  double yGlowYTranslate;
  Color firstGradientColor;
  Color secondGradientColor;
  Color glowColor;
  double glowOpacity;
  late Path somePath;

  MeshCirclePainter(
    this.path,
    Size size, {
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.glowColor,
    required this.glowOpacity,
    required this.xScaleglow,
    required this.yGlowScale,
    required this.xGlowXTranslate,
    required this.yGlowYTranslate,
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
    final scalingMatrix = Matrix4(
      xScaleglow, 0, 0, 0, //
      0, yGlowScale, 0, 0, //
      0, 0, 1, 0, //
      xGlowXTranslate, yGlowYTranslate, 0, 1, //
    );

    somePath = path.transform(scalingMatrix.storage);
    // somePath = path;
    myPaint.style = PaintingStyle.stroke;
    myPaint.strokeWidth = 5.0;
    myPaint.color = Colors.white;

    theGlowPaint = Paint();
    if (glowOpacity > 0) {
      print(glowOpacity);
      theGlowPaint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);
      theGlowPaint.color = glowColor.withOpacity(glowOpacity);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (glowOpacity > 0) {
      canvas.drawPath(somePath, theGlowPaint);
    }
    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(MeshCirclePainter oldDelegate) => true;
}
