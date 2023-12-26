import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class AvailabilitySectorsPainter extends CustomPainter {
  final double sectorLength;
  AvailabilitySectorsPainter({
    required this.sectorLength,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final double redArcRadius = size.width * .46;
    final double blueArcRadius = size.width * .475;
    final center = Offset(
      size.width.half(),
      size.height.half() - 130,
    );

    drawAvailabilitySectors(
      canvas,
      size,
      center,
      blueArcRadius,
      AvailabilitySectorConstants.userArcStops,
      AvailabilitySectorConstants.userArcLengths,
      ModelGradientOptions.user,
      AvailabilitySectorConstants.userArcShouldReverseStops,
    );
    drawAvailabilitySectors(
      canvas,
      size,
      center,
      redArcRadius,
      AvailabilitySectorConstants.collaboratorArcStops,
      AvailabilitySectorConstants.collaboratorArcLengths,
      ModelGradientOptions.collaborator,
      AvailabilitySectorConstants.collaboratorArcShouldReverseStops,
    );
  }

  drawAvailabilitySectors(
    Canvas canvas,
    Size size,
    Offset center,
    double arcRadius,
    List<List<double>> stops,
    List<double> arcLengths,
    ModelGradientOptions gradient,
    List<bool> shouldReverseColors,
  ) {
    final chosenGradient = gradient == ModelGradientOptions.user
        ? ModelGradients.userGradient
        : ModelGradients.collaboratorGradient;
    for (int i = 0; i < stops.length; i++) {
      Paint arc1Paint = Paint()
        ..strokeCap = StrokeCap.square
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke
        ..shader = LinearGradient(
          colors: shouldReverseColors[i]
              ? chosenGradient.reversed.toList()
              : chosenGradient,
          stops: stops[i],
        ).createShader(Rect.fromCircle(center: center, radius: arcRadius));
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: arcRadius),
        pi - arcLengths[i],
        pi - sectorLength,
        false,
        arc1Paint,
      );
    }
  }

  @override
  bool shouldRepaint(AvailabilitySectorsPainter oldDelegate) => true;
}
