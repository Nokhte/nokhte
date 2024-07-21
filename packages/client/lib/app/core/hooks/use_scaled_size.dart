import 'package:flutter/material.dart';

double useScaledSize({
  required double baseValue,
  double bumpPerHundredth = 0.002,
  required Size screenSize,
}) {
  final double currentAspectRatio = screenSize.height / screenSize.width;
  const double baselineAspectRatio = 844 / 390;

  final double aspectRatioDifference = currentAspectRatio - baselineAspectRatio;

  final double steps = aspectRatioDifference / 0.01;

  final double adjustment = steps * bumpPerHundredth;

  return screenSize.height *
      (aspectRatioDifference.isNegative
              ? baseValue - adjustment
              : baseValue + adjustment)
          .clamp(0.0, double.infinity);
}
