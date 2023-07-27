/// breathing_pentagons_painter.dart
import 'package:flutter/material.dart';
import 'pentagon_data.dart';
import 'package:primala/app/core/canvas_widget_utils/draw_a.dart';

class BreathingPentagonsPainter extends CustomPainter {
  final Animation<double> animation;
  BreathingPentagonsPainter({required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.height * .04;
    final double scale = animation.value; // Scale animation value
    const double rotationScalingConstant = 5.0;

    final Paint paint1 =
        PentagonData.getPentagon1Paint(centerX, centerY, radius);
    final Paint paint2 =
        PentagonData.getPentagon2Paint(centerX, centerY, radius);
    final Paint paint3 =
        PentagonData.getPentagon3Paint(centerX, centerY, radius);
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
      canvas.rotate(angleList[i] + (scale * rotationScalingConstant));
      canvas.scale(scale);
      DrawA.pentagon(canvas, paintList[i]);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(BreathingPentagonsPainter oldDelegate) => true;
}
