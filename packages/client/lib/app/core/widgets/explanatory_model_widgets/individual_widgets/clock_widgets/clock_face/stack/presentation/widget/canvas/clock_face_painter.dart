import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ClockFacePainter extends CustomPainter {
  final ClockFacePainterProperties props;
  Paint linePaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 2.0;

  ClockFacePainter({
    required this.props,
  });

  drawHourLines(Canvas canvas, Offset center, double radius) {
    for (int hourLine = 0; hourLine < 12; hourLine++) {
      if (hourLine % 3 == 0 && props.hourMarkLength.isGreaterThan(0)) {
        if (isThreeHourMark(hourLine)) {
          drawHourMarkLines(
            props.numberOfLinesByHourMark[hourLine],
            hourLine,
            center,
            radius,
            canvas,
            props.three.rotations,
            props.three.translations,
            props.three.lengths,
          );
        } else if (isSixHourMark(hourLine)) {
          drawHourMarkLines(
            props.numberOfLinesByHourMark[hourLine],
            hourLine,
            center,
            radius,
            canvas,
            props.six.rotations,
            props.six.translations,
            props.six.lengths,
          );
        } else if (isNineHourMark(hourLine)) {
          drawHourMarkLines(
            props.numberOfLinesByHourMark[hourLine],
            hourLine,
            center,
            radius,
            canvas,
            props.nine.rotations,
            props.nine.translations,
            props.nine.lengths,
          );
        } else if (isTwelveHourMark(hourLine)) {
          drawHourMarkLines(
            props.numberOfLinesByHourMark[hourLine],
            hourLine,
            center,
            radius,
            canvas,
            props.twelve.rotations,
            props.twelve.translations,
            props.twelve.lengths,
          );
        }
      } else {
        double lineLength = props.hourMarkLength;
        final coordinates =
            getCoordinates(hourLine, center, radius, lineLength);
        canvas.drawLine(coordinates.startingCoordinates,
            coordinates.endingCoordinates, linePaint);
      }
    }
  }

  drawHourMarkLines(
    int numberOfLines,
    int hourMarkIndex,
    Offset center,
    double radius,
    Canvas canvas,
    List<double> rotations,
    List<double> translations,
    List<double> lengths,
  ) {
    for (int i = 0; i < numberOfLines; i++) {
      final coordinates = getCoordinates(
        hourMarkIndex,
        center,
        radius,
        lengths[i],
        additionalRotation: rotations[i],
        additionalXTranslation: translations[i],
      );
      canvas.drawLine(coordinates.startingCoordinates,
          coordinates.endingCoordinates, linePaint);
    }
  }

  HourMarkPainterInformation getCoordinates(
    int hourIndex,
    Offset center,
    double radius,
    double lineLength, {
    double additionalXTranslation = 0.0,
    double additionalYTranslation = 0.0,
    double additionalRotation = 0.0,
  }) {
    double angle = (pi * 2 * (hourIndex / 12));

    double centerX = center.dx + cos(angle) * radius;
    double centerY = center.dy + sin(angle) * radius;

    double x1 = centerX - lineLength.half() * cos(angle + additionalRotation);
    double y1 = centerY - lineLength.half() * sin(angle + additionalRotation);

    double x2 = centerX + lineLength.half() * cos(angle + additionalRotation);
    double y2 = centerY + lineLength.half() * sin(angle + additionalRotation);

    return HourMarkPainterInformation(
      startingCoordinates:
          Offset(x1 + additionalXTranslation, y1 + additionalYTranslation),
      endingCoordinates:
          Offset(x2 + additionalXTranslation, y2 + additionalYTranslation),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width.half(), size.height.half() - 130);
    final double radius = size.width * .4;
    drawHourLines(canvas, center, radius);
  }

  @override
  bool shouldRepaint(ClockFacePainter oldDelegate) => true;

  bool isThreeHourMark(int i) => i == 0;
  bool isSixHourMark(int i) => i == 3;
  bool isNineHourMark(int i) => i == 6;
  bool isTwelveHourMark(int i) => i == 9;
}
