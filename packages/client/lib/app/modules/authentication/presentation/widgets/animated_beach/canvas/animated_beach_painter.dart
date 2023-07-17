import 'package:flutter/material.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/animated_beach_api.dart';
import 'package:touchable/touchable.dart';

class AnimatedBeachPainter extends CustomPainter {
  BuildContext context;
  BeachInteractionType interactionType;

  AnimatedBeachPainter({
    required this.context,
    required this.interactionType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    TouchyCanvas touchyCanvas = TouchyCanvas(context, canvas);
    AnimatedBeachAPI.programAndRender(
      canvas: touchyCanvas,
      size: size,
      interactionType: interactionType,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
