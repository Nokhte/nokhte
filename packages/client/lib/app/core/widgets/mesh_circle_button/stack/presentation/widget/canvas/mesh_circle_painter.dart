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

    // Add white border properties here
    myPaint.style = PaintingStyle.stroke; // Set the style to stroke
    myPaint.strokeWidth = 5.0; // Adjust the border width as needed
    myPaint.color = Colors.white; // Set the border color to white
    // drawPath(shadowPath, shadowPaint);

    // myPaint.color = Colors.withOpacity(.5);
    // myPaint.strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path shadowPath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius:
              size.width / 2.5 + 1.0)); // Adjust the shadow radius as needed.

    Paint shadowPaint = Paint()
      ..color = const Color(0x3600FF75)
          .withOpacity(0.5) // Adjust the shadow color and opacity.
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, 5.0); // Adjust the blur radius.

    canvas.drawPath(shadowPath, shadowPaint);

    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(MeshCirclePainter oldDelegate) => true;
}
