import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'canvas/mesh_circle_painter.dart';

class MeshCircleButton extends StatelessWidget {
  final MeshCircleButtonStore trackerStore;
  final Size size;
  const MeshCircleButton({
    super.key,
    required this.trackerStore,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: trackerStore.opacity,
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
            tween: trackerStore.movie,
            control: trackerStore.control,
            duration: trackerStore.movie.duration,
            builder: (context, value, child) {
              trackerStore.setCurrentGlowColor(value.get('color'));
              trackerStore.setCurrentMatrixValues(
                newXTranslate: value.get("Xtranslate"),
                newYTranslate: value.get('Ytranslate'),
                newXScale: value.get('Xscale'),
                newYScale: value.get('Yscale'),
              );
              return SizedBox(
                width: size.width,
                height: size.height,
                child: CustomPaint(
                  painter: MeshCirclePainter(
                    SvgAnimtionConstants.circlePath,
                    size,
                    firstGradientColor: Colors.white,
                    secondGradientColor: Colors.white,
                    glowColor: value.get('color'),
                    glowOpacity: value.get('opacity'),
                    xGlowXTranslate: value.get('Xtranslate'),
                    yGlowYTranslate: value.get('Ytranslate'),
                    xScaleglow: value.get('Xscale'),
                    yGlowScale: value.get('Yscale'),
                  ),
                  child: ClipPath(
                    clipper: CustomPathClipper(SvgAnimtionConstants.circlePath),
                    child: AnimatedMeshGradient(
                      controller: trackerStore.meshGradientController,
                      colors: const [
                        Color(0xFF88F4FC),
                        Color(0xFF0BB7FC),
                        Color(0xFF6FE6C9),
                        Color(0xFF67EEAC),
                      ],
                      options: AnimatedMeshGradientOptions(),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
