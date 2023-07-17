import 'package:flutter/material.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/animated_beach_paths.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/constants/beach_path_id.dart';
import 'package:touchable/touchable.dart';

class AnimatedBeachAPI {
  static void programAndRender({
    required TouchyCanvas canvas,
    required Size size,
    required BeachInteractionType interactionType,
  }) {
    for (int i = 0; i < AnimatedBeachPaths.list.length; i++) {
      BeachPathId currentPath = AnimatedBeachPaths.list[i];
      canvas.drawPath(
          currentPath.pathInformation(size), currentPath.fillInformation(size));
    }
  }
}
