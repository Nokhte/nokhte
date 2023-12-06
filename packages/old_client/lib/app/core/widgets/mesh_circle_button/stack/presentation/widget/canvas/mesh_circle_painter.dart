import 'package:flutter/material.dart';

class MeshCirclePainter extends CustomPainter {
  Path mainCircleOutlinePath;
  late Paint myPaint;
  late Paint theGlowPaint;
  double xGlowScale;
  double yGlowScale;
  double xGlowTranslate;
  double yGlowTranslate;
  Color firstGradientColor;
  Color secondGradientColor;
  Color glowColor;
  double glowOpacity;
  late Path theGlowPath;

  MeshCirclePainter(
    this.mainCircleOutlinePath,
    Size size, {
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.glowColor,
    required this.glowOpacity,
    required this.xGlowScale,
    required this.yGlowScale,
    required this.xGlowTranslate,
    required this.yGlowTranslate,
  }) {
    mainCircleOutlinePath.getBounds();
    myPaint = Paint()
      ..shader = RadialGradient(colors: [
        firstGradientColor,
        secondGradientColor,
      ], stops: const [
        0,
        1.8,
      ]).createShader(
        mainCircleOutlinePath.getBounds(),
      );
    final scalingMatrix = Matrix4(
      xGlowScale, 0, 0, 0, //
      0, yGlowScale, 0, 0, //
      0, 0, 1, 0, //
      xGlowTranslate, yGlowTranslate, 0, 1, //
    );

    theGlowPath = mainCircleOutlinePath.transform(scalingMatrix.storage);
    myPaint.style = PaintingStyle.stroke;
    myPaint.strokeWidth = 5.0;
    myPaint.color = Colors.white;

    theGlowPaint = Paint();
    if (glowOpacity > 0) {
      theGlowPaint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);
      theGlowPaint.color = glowColor.withOpacity(glowOpacity);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (glowOpacity > 0) {
      canvas.drawPath(theGlowPath, theGlowPaint);
    }
    canvas.drawPath(mainCircleOutlinePath, myPaint);
  }

  @override
  bool shouldRepaint(MeshCirclePainter oldDelegate) => true;
}
