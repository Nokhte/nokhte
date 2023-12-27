import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class AvailabilitySectorsPainter extends CustomPainter {
  final List<double> redSectorLengths;
  final List<double> blueSectorLengths;
  final List<List<Color>> blueSectorGradients;
  final List<List<Color>> redSectorGradients;
  final List<double> redSectorRadii;
  final List<double> blueSectorRadii;

  AvailabilitySectorsPainter({
    required this.redSectorLengths,
    required this.blueSectorLengths,
    required this.redSectorGradients,
    required this.blueSectorGradients,
    required this.blueSectorRadii,
    required this.redSectorRadii,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double redArcRadius = size.width * .46;
    final double blueArcRadius = size.width * .475;
    final List<double> normalizedRedSectorRadii = [];
    final List<double> normalizedBlueSectorRadii = [];
    for (int i = 0; i < redSectorRadii.length; i++) {
      normalizedRedSectorRadii.add(redArcRadius * redSectorRadii[i]);
      normalizedBlueSectorRadii.add(blueArcRadius * blueSectorRadii[i]);
    }
    final center = Offset(
      size.width.half(),
      size.height.half() - 130,
    );

    drawAvailabilitySectors(
      canvas,
      size,
      center,
      normalizedBlueSectorRadii,
      AvailabilitySectorConstants.userArcStops,
      AvailabilitySectorConstants.userArcLengths,
      blueSectorGradients,
      AvailabilitySectorConstants.userArcShouldReverseStops,
      blueSectorLengths,
    );
    drawAvailabilitySectors(
      canvas,
      size,
      center,
      normalizedRedSectorRadii,
      AvailabilitySectorConstants.collaboratorArcStops,
      AvailabilitySectorConstants.collaboratorArcLengths,
      redSectorGradients,
      AvailabilitySectorConstants.collaboratorArcShouldReverseStops,
      redSectorLengths,
    );
  }

  drawAvailabilitySectors(
    Canvas canvas,
    Size size,
    Offset center,
    List<double> arcRadii,
    List<List<double>> stops,
    List<double> arcLengths,
    List<List<Color>> gradients,
    List<bool> shouldReverseColors,
    List<double> sectorLengths,
  ) {
    for (int i = 0; i < stops.length; i++) {
      Paint arc1Paint = Paint()
        ..strokeCap = StrokeCap.square
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke
        ..shader = LinearGradient(
          colors: shouldReverseColors[i]
              ? gradients[i].reversed.toList()
              : gradients[i],
          stops: stops[i],
        ).createShader(Rect.fromCircle(center: center, radius: arcRadii[i]));
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: arcRadii[i]),
        pi - arcLengths[i],
        pi - sectorLengths[i],
        false,
        arc1Paint,
      );
    }
  }

  @override
  bool shouldRepaint(AvailabilitySectorsPainter oldDelegate) => true;
}
