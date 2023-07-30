/// breathing_pentagons_painter.dart
import 'package:flutter/material.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/constants.dart';
import 'package:primala/app/core/canvas_widget_utils/draw_a.dart';

class BreathingPentagonsPainter extends CustomPainter {
  double scale;
  double angle;
  Color firstPentagonFirstGradient;
  Color firstPentagonSecondGradient;
  Color secondPentagonFirstGradient;
  Color secondPentagonSecondGradient;
  Color thirdPentagonFirstGradient;
  Color thirdPentagonSecondGradient;
  BreathingPentagonsPainter({
    required this.scale,
    required this.angle,
    required this.firstPentagonFirstGradient,
    required this.firstPentagonSecondGradient,
    required this.secondPentagonFirstGradient,
    required this.secondPentagonSecondGradient,
    required this.thirdPentagonFirstGradient,
    required this.thirdPentagonSecondGradient,
  });
  // : super(repaint: scale);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.height * .04;
    const double rotationScalingConstant = 5.0;

    final Paint paint1 =
        PentagonData.getPentagonPaint(centerX, centerY, radius, [
      firstPentagonFirstGradient,
      firstPentagonSecondGradient,
    ]);
    final Paint paint2 =
        PentagonData.getPentagonPaint(centerX, centerY, radius, [
      secondPentagonFirstGradient,
      secondPentagonSecondGradient,
    ]);
    final Paint paint3 =
        PentagonData.getPentagonPaint(centerX, centerY, radius, [
      thirdPentagonFirstGradient,
      thirdPentagonSecondGradient,
    ]);
    final List<Paint> paintList = [
      paint1,
      paint2,
      paint3,
    ];

    final List<double> angleList = [
      PentagonData.pentagon1Angle,
      PentagonData.pentagon2Angle,
      PentagonData.pentagon3Angle
    ];
    for (int i = 0; i < paintList.length; i++) {
      canvas.save();
      canvas.translate(centerX, centerY);
      canvas.rotate((angleList[i] + (angle) * rotationScalingConstant));
      canvas.scale(scale);
      DrawA.pentagon(canvas, paintList[i]);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(BreathingPentagonsPainter oldDelegate) => true;
}
