import 'dart:math';
import 'package:flutter/material.dart';

class DrawA {
  static void pentagon(Canvas canvas, Paint paint) {
    const double sideLength = 100; // You can adjust this as needed
    const double rotation = 2 * pi / 5;
    final Path path = Path();

    for (int i = 0; i < 5; i++) {
      final double x = cos(i * rotation);
      final double y = sin(i * rotation);
      if (i == 0) {
        path.moveTo(x * sideLength, y * sideLength);
      } else {
        path.lineTo(x * sideLength, y * sideLength);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }
}
