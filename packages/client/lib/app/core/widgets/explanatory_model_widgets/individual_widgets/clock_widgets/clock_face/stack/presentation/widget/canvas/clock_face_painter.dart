import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ClockFacePainter extends CustomPainter {
  final ClockFacePainterProperties props;

  ClockFacePainter({
    required this.props,
  });

  drawHourLines(Canvas canvas, Offset center, double radius) {
    double lineLength = 0.0;
    final Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    for (int i = 0; i < 12; i++) {
      if (i % 3 == 0 && props.hourMarkLength.isGreaterThan(0)) {
        if (isThreeHourMark(i)) {
          lineLength = props.hourMarkLength + 10.0; // starts at 3
          final coordinates = getCoordinates(
            i,
            center,
            radius,
            lineLength,
            additionalRotation: props.three.lineOneRotation,
            additionalXTranslation: props.three.lineOneTranslation,
          );
          canvas.drawLine(coordinates.startingCoordinates,
              coordinates.endingCoordinates, linePaint);
        } else if (isSixHourMark(i)) {
          lineLength = props.hourMarkLength + 10.0; // starts at 6
          final coordinates = getCoordinates(i, center, radius, lineLength);
          canvas.drawLine(coordinates.startingCoordinates,
              coordinates.endingCoordinates, linePaint);
        } else if (isNineHourMark(i)) {
          lineLength = props.hourMarkLength + 10.0; // starts at 9
          final coordinates = getCoordinates(i, center, radius, lineLength);
          canvas.drawLine(coordinates.startingCoordinates,
              coordinates.endingCoordinates, linePaint);
        } else if (isTwelveHourMark(i)) {
          lineLength = props.hourMarkLength + 10.0; // 12
          final coordinates = getCoordinates(i, center, radius, lineLength);
          canvas.drawLine(coordinates.startingCoordinates,
              coordinates.endingCoordinates, linePaint);
        }
      } else {
        lineLength = props.hourMarkLength;
        final coordinates = getCoordinates(i, center, radius, lineLength);
        canvas.drawLine(coordinates.startingCoordinates,
            coordinates.endingCoordinates, linePaint);
      }
    }
  }

  HourMarkPainterInformation getCoordinates(
    int i,
    Offset center,
    double radius,
    double lineLength, {
    double additionalXTranslation = 0.0,
    double additionalYTranslation = 0.0,
    double additionalRotation = 0.0,
  }) {
    double angle = (pi * 2 * (i / 12));

    double centerX = center.dx + cos(angle) * radius;
    double centerY = center.dy + sin(angle) * radius;

    double x1 = centerX - (lineLength / 2) * cos(angle + additionalRotation);
    double y1 = centerY - (lineLength / 2) * sin(angle + additionalRotation);

    double x2 = centerX + (lineLength / 2) * cos(angle + additionalRotation);
    double y2 = centerY + (lineLength / 2) * sin(angle + additionalRotation);

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
