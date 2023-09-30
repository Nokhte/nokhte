import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/constants/constants.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/utils/utils.dart';

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
        PentagonPainterHelper.getRadialGradient(centerX, centerY, radius, [
      firstPentagonFirstGradient,
      firstPentagonSecondGradient,
    ]);
    final Paint paint2 =
        PentagonPainterHelper.getRadialGradient(centerX, centerY, radius, [
      secondPentagonFirstGradient,
      secondPentagonSecondGradient,
    ]);
    final Paint paint3 =
        PentagonPainterHelper.getRadialGradient(centerX, centerY, radius, [
      thirdPentagonFirstGradient,
      thirdPentagonSecondGradient,
    ]);
    final List<Paint> paintList = [
      paint1,
      paint2,
      paint3,
    ];

    final List<double> angleList = [
      PentagonAngles.pentagon1Angle,
      PentagonAngles.pentagon2Angle,
      PentagonAngles.pentagon3Angle
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
