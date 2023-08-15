/// breathing_pentagons_painter.dart
///
/// Proofreader Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th 2023
///
/// Author: Sonny Vesali
///
/// A custom painter class responsible for painting the breathing pentagons on a canvas.
/// It uses the provided scale and angle values to determine the size and rotation
/// of the pentagons. The painter fills each pentagon with gradient colors defined by
/// firstPentagonFirstGradient, firstPentagonSecondGradient, secondPentagonFirstGradient,
/// secondPentagonSecondGradient, thirdPentagonFirstGradient, and thirdPentagonSecondGradient.
///
/// Constructor:
/// - BreathingPentagonsPainter: Constructs the painter with required parameters.
///
/// Properties:
/// - scale: A double representing the scaling factor of the pentagons. It determines the
/// size of the pentagons.
///
/// - angle: A double representing the rotation angle of the pentagons. It controls the
/// rotation of the pentagons.
///
/// - firstPentagonFirstGradient: A Color representing the first gradient color of the
/// first pentagon.
///
/// - firstPentagonSecondGradient: A Color representing the second gradient color of the
/// first pentagon.
///
/// - secondPentagonFirstGradient: A Color representing the first gradient color of the
/// second pentagon.
///
/// - secondPentagonSecondGradient: A Color representing the second gradient color of the
/// second pentagon.
///
/// - thirdPentagonFirstGradient: A Color representing the first gradient color of the
/// third pentagon.
///
/// - thirdPentagonSecondGradient: A Color representing the second gradient color of the
/// third pentagon.
///
/// Methods:
/// - paint: Overrides the paint method from CustomPainter to draw the pentagons on the
/// provided canvas. It uses the PentagonPainterHelper.getRadialGradient method
/// to create radial gradient fills for each pentagon and then uses the DrawA.pentagon
/// method to draw the pentagons on the canvas. The scale and angle properties
/// are applied to each pentagon to control their size and rotation.
///
/// - shouldRepaint: Overrides the shouldRepaint method from CustomPainter. It always
/// returns true, indicating that the painter should repaint whenever
/// there's a change in the state or properties of the painter. This ensures
/// that any updates to the animation or gradients are immediately reflected
/// on the canvas.
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/constants/constants.dart';
import 'package:primala/app/core/canvas_widget_utils/draw_a.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/utils/utils.dart';

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
