/// breathing_pentagons_painter.dart
import 'package:flutter/material.dart';
import 'pentagon_data.dart';
import 'package:primala/app/core/canvas_widget_utils/draw_a.dart';

class BreathingPentagonsPainter extends CustomPainter {
  double scale;
  double angle;
  BreathingPentagonsPainter({
    required this.scale,
    required this.angle,
  });
  // : super(repaint: scale);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.height * .04;
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
    // print(animation);
    for (int i = 0; i < paintList.length; i++) {
      canvas.save();
      canvas.translate(centerX, centerY);
      // canvas.rotate(angleList[i]);
      canvas.rotate((angleList[i] + (angle) * rotationScalingConstant));
      canvas.scale(scale);
      // canvas.scale(1.3);
      DrawA.pentagon(canvas, paintList[i]);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(BreathingPentagonsPainter oldDelegate) => true;
}

/// so one thing I'm getting overwhelmed with is the fact that where should these values be stored is the question, and where should this
/// specific functionality get implemented exactly?? I'm thinking that what we have just specified here is the expansion and contraction
/// animation directly in the painter so what you have done here is that you have directly tied together things which should be separated
/// and injected via some interface, so what has happen is the injection of the animation into the painter so you have
/// 1. Constant 3 Pentagons
/// 2. Constant Starting Angles `angleList[i]`
/// 3. Constant Rotation Scaling Constant
/// =========================================
/// Ok so what you would want to do is that you would want to inject is I like the for loop component just