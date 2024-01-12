import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class WaitingTextPainter extends CustomPainter {
  final double topLengthScalar;
  final double roundness;
  final double circleOpacity;
  final double rectOpacity;
  final double circleRadius;
  final double circleXOffset;
  final double circleYOffset;
  final OpacityAndRadius ripple1Arc1, ripple1Arc2, ripple1Arc3;
  late Offset firstRippleOffset;
  late Offset secondRippleOffset;
  WaitingTextPainter({
    required this.topLengthScalar,
    required this.roundness,
    required this.circleOpacity,
    required this.rectOpacity,
    required this.circleRadius,
    required this.circleXOffset,
    required this.circleYOffset,
    required this.ripple1Arc1,
    required this.ripple1Arc2,
    required this.ripple1Arc3,
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

    final rectPaint = Paint()..color = Colors.white.withOpacity(rectOpacity);
    final circlePaint = Paint()
      ..color = Colors.white.withOpacity(circleOpacity);

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(roundness),
    );

    firstRippleOffset =
        Offset((centerX * 1.11 - 1) + -10.0, (lineStartY - 1) + 50.0);

    secondRippleOffset =
        Offset((centerX * 1.11 - 1) + -30.0, (lineStartY - 1) + 150.0);
    Paint arc1Paint = Paint()
      ..color = Colors.white.withOpacity(ripple1Arc1.opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(firstRippleOffset, ripple1Arc1.radius, arc1Paint);

    Paint arc2Paint = Paint()
      ..color = Colors.white.withOpacity(ripple1Arc2.opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(secondRippleOffset, ripple1Arc2.radius, arc2Paint);

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
