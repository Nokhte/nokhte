import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class WaitingTextPainter extends CustomPainter {
  final double topLengthScalar,
      roundness,
      circleOpacity,
      rectOpacity,
      circleRadius,
      circleXOffset,
      circleYOffset;
  final OpacityAndRadius ripple1, ripple2;
  late Offset firstRippleOffset, secondRippleOffset;
  final Color rectColor, ripple1Color, ripple2Color;
  WaitingTextPainter({
    required this.topLengthScalar,
    required this.roundness,
    required this.circleOpacity,
    required this.rectOpacity,
    required this.circleRadius,
    required this.circleXOffset,
    required this.circleYOffset,
    required this.ripple1,
    required this.ripple2,
    required this.rectColor,
    required this.ripple1Color,
    required this.ripple2Color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = (size.width / 2);
    final double centerY = (size.height / 2) - (size.height * .125);

    const double lineLengthPercentage = 0.11;

    final double minDimension =
        size.width < size.height ? size.width : size.height;
    final double lineLength = minDimension * lineLengthPercentage;

    final double lineStartY =
        (centerY - (lineLength / 2)) - (topLengthScalar * lineLength);
    final double lineEndY = (centerY + (lineLength / 2));

    final rect = Rect.fromPoints(
      Offset(centerX * 1.11 - 4, lineStartY - 3),
      Offset(centerX * 1.11 + 1, lineEndY + -1),
    );

    final rectPaint = Paint()..color = rectColor.withOpacity(rectOpacity);
    final circlePaint = Paint()
      ..color = ripple1Color.withOpacity(circleOpacity);

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(roundness),
    );

    firstRippleOffset =
        Offset((centerX * 1.11 - 1) + -10.0, (lineStartY - 1) + 50.0);

    secondRippleOffset =
        Offset((centerX * 1.11 - 1) + -30.0, (lineStartY - 1) + 150.0);
    Paint arc1Paint = Paint()
      ..color = ripple1Color.withOpacity(ripple1.opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(firstRippleOffset, ripple1.radius, arc1Paint);

    Paint arc2Paint = Paint()
      ..color = ripple2Color.withOpacity(ripple2.opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(secondRippleOffset, ripple2.radius, arc2Paint);

    canvas.drawRRect(rrect, rectPaint);
    canvas.drawCircle(
        Offset((centerX * 1.11 - 1) + circleXOffset,
            (lineStartY - 1) + circleYOffset),
        circleRadius,
        circlePaint);
  }

  @override
  bool shouldRepaint(WaitingTextPainter oldDelegate) => true;
}
