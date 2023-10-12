import 'package:flutter/material.dart';

class BeachHorizonWaterPainter extends CustomPainter {
  // final double waterValue;
  final Color firstGradientColor,
      secondGradientColor,
      thirdGradientColor,
      fourthGradientColor,
      fifthGradientColor,
      sixthGradientColor,
      seventhGradientColor,
      eighthGradientColor;
  final double firstGradientStop,
      secondGradientStop,
      thirdGradientStop,
      fourthGradientStop,
      fifthGradientStop,
      sixthGradientStop,
      seventhGradientStop,
      waterValue,
      eighthGradientStop;
  final List<double> stopsList;
  final List<Color> colorsList;

  BeachHorizonWaterPainter({
    required this.waterValue,
    required this.firstGradientColor,
    required this.secondGradientColor,
    required this.thirdGradientColor,
    required this.fourthGradientColor,
    required this.fifthGradientColor,
    required this.sixthGradientColor,
    required this.seventhGradientColor,
    required this.eighthGradientColor,
    required this.firstGradientStop,
    required this.secondGradientStop,
    required this.thirdGradientStop,
    required this.fourthGradientStop,
    required this.fifthGradientStop,
    required this.sixthGradientStop,
    required this.seventhGradientStop,
    required this.eighthGradientStop,
  })  : colorsList = [
          firstGradientColor,
          secondGradientColor,
          thirdGradientColor,
          fourthGradientColor,
          fifthGradientColor,
          sixthGradientColor,
          seventhGradientColor,
          eighthGradientColor,
        ],
        stopsList = [
          firstGradientStop,
          secondGradientStop,
          thirdGradientStop,
          fourthGradientStop,
          fifthGradientStop,
          sixthGradientStop,
          seventhGradientStop,
          eighthGradientStop,
        ];

  @override
  void paint(Canvas canvas, Size size) {
    final waveGradient = LinearGradient(
      colors: colorsList,
      stops: stopsList,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final rectHeight = size.height - waterValue;
    final waterPaint = Paint()
      ..shader = waveGradient.createShader(
        Rect.fromPoints(
          Offset(0, size.height - rectHeight),
          Offset(size.width, size.height),
        ),
      );
    // print("${size.height} ${size.width} FROM HORIZON");
    // Rect.fromLTWH(0, 0, size.width, size.height));
    final rect = Rect.fromPoints(
      Offset(0, size.height - rectHeight),
      Offset(size.width, size.height),
    );

    canvas.drawRect(rect, waterPaint);

    // Apply the wave gradient
  }

  @override
  bool shouldRepaint(BeachHorizonWaterPainter oldDelegate) {
    return oldDelegate != this;
  }
}
