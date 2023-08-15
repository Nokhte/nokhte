/// pentagon_painter_helper.dart
///
/// Proofreading Information:
/// - Proofreader: Sonny Vesali
/// - Date: July 30th, 2023
///
/// Author: Sonny Vesali
///
/// A utility class that provides helper methods for working with radial
/// gradients in the context of drawing pentagons. This class contains a single
/// static method called `getRadialGradient`.
///
/// The `getRadialGradient` method is used to create a `Paint` object with a
/// radial gradient shader. It takes the following parameters:
///
/// - `centerX`: The X-coordinate of the center of the radial gradient.
/// - `centerY`: The Y-coordinate of the center of the radial gradient.
/// - `radius`: The radius of the radial gradient.
/// - `colors`: A list of `Color` objects representing the colors of the gradient.
///
/// The method returns a `Paint` object that can be used to fill shapes with the
/// specified radial gradient. The radial gradient is centered at the point (`centerX`, `centerY`)
/// with the given `radius`, and the colors are applied as the gradient spreads outward from the center.
///
/// The `radiusConstant` is a static property that determines the size of the gradient circle
/// in relation to the center point. It is set to a constant value of `0.01`, and it is used to
/// adjust the size of the gradient circle. The actual radius of the gradient circle is calculated
/// as `radius + 3` to add some extra padding around the gradient.
///
/// This class is useful for creating gradient fills for pentagon shapes and can be used in the
/// `BreathingPentagonsPainter` class or any other custom painter that requires radial gradients
/// for drawing pentagons or similar shapes.

import 'package:flutter/material.dart';

class PentagonPainterHelper {
  static double get radiusConstant => .01;

  static Paint getRadialGradient(
    double centerX,
    double centerY,
    double radius,
    List<Color> colors,
  ) {
    final Paint paint1 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: radius,
        colors: colors,
      ).createShader(
        Rect.fromCircle(
          center: Offset(
            centerX * radiusConstant,
            centerY * radiusConstant,
          ),
          radius: radius + 3,
        ),
      );
    return paint1;
  }
}
