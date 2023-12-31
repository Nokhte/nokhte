import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/individual_widgets/individual_cross_nokhte/gradient_cross_nokhte/stack/utils/gradient_cross_nokhte_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/gradient_cross_nokhte_painter.dart';

class GradientCrossNokhte extends StatelessWidget {
  final GradientCrossNokhteStore store;
  final List<Offset> offsets;
  final List<int> gradientColorLengths;

  const GradientCrossNokhte({
    super.key,
    required this.store,
    required this.offsets,
    required this.gradientColorLengths,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        onEnd: () => store.toggleHasFadedIn(),
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          builder: (context, value, child) => SizedBox.expand(
            child: CustomPaint(
              painter: GradientCrossNokhtePainter(
                offsets: offsets,
                gradients: GradientCrossNokhteUtils.getGradients(
                  value,
                  offsets,
                  gradientColorLengths,
                ),
                stops: GradientCrossNokhteUtils.getStops(
                  value,
                  offsets,
                  gradientColorLengths,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
