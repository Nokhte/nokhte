import 'package:flutter/material.dart';

class SunAndMoonPainter extends CustomPainter {
  final List<Color> colorGrad;
  final double verticalConstant;
  final bool isTheMoon;
  SunAndMoonPainter({
    required this.colorGrad,
    required this.verticalConstant,
    required this.isTheMoon,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //
    final center = Offset(size.width / 2, (size.height) + verticalConstant);

    // Define the radius of the circle
    final radius = size.width / 4;

    // Create a RadialGradient for the circle
    final gradient = RadialGradient(
      colors: colorGrad,
      center: Alignment.center,
      radius: 0.3, // Adjust the radius as needed
    );

    // Create a Paint object with the gradient
    final paint = Paint()
      ..shader = gradient
          .createShader(Rect.fromCircle(center: center, radius: radius));

    // Draw the circle in the center of the canvas

    for (int i = 0; i < (isTheMoon ? 23 : 12); i++) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return oldDelegate != this;
  }
}
