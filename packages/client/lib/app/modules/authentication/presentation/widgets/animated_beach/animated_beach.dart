import 'package:flutter/material.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/animated_beach_painter.dart';
import 'package:touchable/touchable.dart';

class AnimatedBeach extends StatelessWidget {
  final BeachInteractionType interactionType;

  const AnimatedBeach({
    super.key,
    required this.interactionType,
  });

  @override
  Widget build(BuildContext context) {
    return CanvasTouchDetector(
        gesturesToOverride: const [],
        builder: (context) {
          // final width = MediaQuery.of(context).size.width;
          final width = double.infinity;
          final padding = MediaQuery.of(context).padding;
          final unrefinedHeight = MediaQuery.of(context).size.height;
          // final height = unrefinedHeight - padding.top - padding.bottom;
          final height = double.infinity;
          Size size = Size(height, width);

          return CustomPaint(
            size: size,
            painter: AnimatedBeachPainter(
              context: context,
              interactionType: BeachInteractionType.none,
            ),
          );
        });
  }
}
