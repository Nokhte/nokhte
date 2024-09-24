import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'shared.dart';

class MultiFocalSpeakingDemoPainter extends CustomPainter
    with DemoPainterUtils {
  final DemoTypes type;
  final List<Color> leftPhoneColorsList;
  final List<Color> rightPhoneColorsList;
  final List<double> leftPhoneStopsList;
  final List<double> rightPhoneStopsList;
  final Color glowColor;
  final double activeTextOpacity,
      restingTextOpacity,
      glowStrokeWidth,
      containerSize;

  MultiFocalSpeakingDemoPainter({
    required this.type,
    required this.containerSize,
    required this.leftPhoneColorsList,
    required this.leftPhoneStopsList,
    required this.rightPhoneColorsList,
    required this.rightPhoneStopsList,
    required this.activeTextOpacity,
    required this.restingTextOpacity,
    required this.glowColor,
    required this.glowStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final leftPhoneGrad = LinearGradient(
      colors: leftPhoneColorsList,
      stops: leftPhoneStopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final rightPhoneGrad = LinearGradient(
      colors: rightPhoneColorsList,
      stops: rightPhoneStopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Offset leftPhoneOffset = getLeftPhoneOffset(size, containerSize);
    final Offset rightPhoneOffset = getRightPhoneOffset(size, containerSize);
    final phoneHeight = getPhoneHeight(containerSize);
    final phoneWidth = getPhoneWidth(containerSize);

    drawPhone(
      canvas,
      leftPhoneOffset,
      phoneWidth,
      phoneHeight,
      leftPhoneGrad,
      phoneCornerRadius,
    );

    drawPhone(
      canvas,
      rightPhoneOffset,
      phoneWidth,
      phoneHeight,
      rightPhoneGrad,
      phoneCornerRadius,
    );

    drawHalfScreenTint(
      canvas,
      rightPhoneOffset,
      phoneWidth,
      phoneHeight,
      phoneCornerRadius,
      activeTextOpacity,
    );

    final lRect = leftPhoneOffset & Size(phoneWidth, phoneHeight);
    final rRect = rightPhoneOffset & Size(phoneWidth, phoneHeight);
    final lCenter = lRect.center;
    final rCenter = rRect.center;

    paintText(
      canvas,
      lCenter,
      'Speaking',
      containerSize,
      activeTextOpacity,
      DemoTextPosition.leftHeader,
      lRect,
    );
    paintText(
      canvas,
      rCenter,
      'Listening',
      containerSize,
      activeTextOpacity,
      DemoTextPosition.leftHeader,
      rRect,
    );
    paintPhoneTexts(
        canvas, leftPhoneOffset, phoneWidth, phoneHeight, restingTextOpacity);
    paintPhoneTexts(
      canvas,
      rightPhoneOffset,
      phoneWidth,
      phoneHeight,
      1,
    );

    drawBlurredBorder(
      canvas,
      leftPhoneOffset,
      phoneWidth,
      phoneHeight,
      phoneCornerRadius,
      glowColor,
      glowStrokeWidth,
    );
  }

  void drawHalfScreenTint(
    Canvas canvas,
    Offset offset,
    double width,
    double height,
    double cornerRadius,
    double opacity,
  ) {
    final gradient = LinearGradient(
      colors: [
        Colors.black.withOpacity(opacity),
        Colors.black.withOpacity(opacity / 4),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(
          offset.dx,
          offset.dy + height / 2,
          width,
          height / 2,
        ),
      );

    final rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        offset.dx,
        offset.dy + height / 2,
        width,
        height / 2,
      ),
      bottomLeft: Radius.circular(cornerRadius),
      bottomRight: Radius.circular(cornerRadius),
    );
    canvas.drawRRect(rrect, paint);
  }

  void paintPhoneTexts(
    Canvas canvas,
    Offset phoneOffset,
    double phoneWidth,
    double phoneHeight,
    double opacity,
  ) {
    final rect = phoneOffset & Size(phoneWidth, phoneHeight);
    final center = rect.center;
    paintText(
      canvas,
      center,
      'Tap to take a note',
      containerSize,
      opacity,
      DemoTextPosition.slightlyAboveCenter,
      rect,
    );
    paintText(
      canvas,
      center,
      'Tap to speak',
      containerSize,
      opacity,
      DemoTextPosition.slightlyBelowCenter,
      rect,
    );
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
