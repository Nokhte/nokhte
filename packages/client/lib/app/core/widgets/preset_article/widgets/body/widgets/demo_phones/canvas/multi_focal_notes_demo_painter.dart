import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'canvas.dart';

class MultiFocalNotesDemoPainter extends CustomPainter with DemoPainterUtils {
  final DemoTypes type;
  final double containerSize;
  final List<Color> colorsList;
  final List<double> stopsList;
  final double aboveCenterTextOpacity,
      aboveCenterTextProgress,
      belowCenterTextOpacity,
      slightlyAboveCenterTextOpacity,
      slightlyBelowCenterTextOpacity;

  MultiFocalNotesDemoPainter({
    required this.type,
    required this.containerSize,
    required this.colorsList,
    required this.stopsList,
    required this.aboveCenterTextOpacity,
    required this.aboveCenterTextProgress,
    required this.belowCenterTextOpacity,
    required this.slightlyAboveCenterTextOpacity,
    required this.slightlyBelowCenterTextOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final grad = LinearGradient(
      colors: colorsList,
      stops: stopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    const double phoneAspectRatio = .5;
    const double phoneCornerRadius = 15.0;

    final double phoneHeight = containerSize * 0.8;
    final double phoneWidth = phoneHeight * phoneAspectRatio;

    final Offset phoneOffset = Offset(
      (size.width - phoneWidth) / 2,
      (size.height - phoneHeight) / 2,
    );

    drawPhone(
        canvas, phoneOffset, phoneWidth, phoneHeight, grad, phoneCornerRadius);
    paintPhoneTexts(canvas, phoneOffset, phoneWidth, phoneHeight);
  }

  paintPhoneTexts(Canvas canvas, Offset phoneOffset, double phoneWidth,
      double phoneHeight) {
    final rect = phoneOffset & Size(phoneWidth, phoneHeight);
    final center = rect.center;

    paintNotesText(
      canvas,
      center,
      'Your note',
      containerSize,
      aboveCenterTextOpacity,
      aboveCenterTextProgress,
      rect,
    );
    paintText(
      canvas,
      center,
      'Tap to take a note',
      containerSize,
      slightlyAboveCenterTextOpacity,
      DemoTextPosition.slightlyAboveCenter,
      rect,
    );
    paintText(
      canvas,
      center,
      'Tap to speak',
      containerSize,
      slightlyBelowCenterTextOpacity,
      DemoTextPosition.slightlyBelowCenter,
      rect,
    );
    paintText(
      canvas,
      center,
      'Swipe up to submit',
      containerSize,
      belowCenterTextOpacity,
      DemoTextPosition.belowCenter,
      rect,
    );
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
