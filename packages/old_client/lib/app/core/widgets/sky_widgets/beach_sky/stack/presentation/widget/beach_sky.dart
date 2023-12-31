import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class BeachSky extends StatelessWidget {
  final BeachSkyStore stateTrackerStore;
  const BeachSky({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  Widget build(context) {
    return Observer(
      builder: (context) {
        return CustomAnimationBuilder(
          tween: stateTrackerStore.movie,
          duration: stateTrackerStore.movie.duration,
          control: stateTrackerStore.control,
          onStarted: () => stateTrackerStore.startAndResetStopWatch(),
          // onCompleted: () => stateTrackerStore.onAnimationComplete(),
          builder: (context, value, child) {
            final skyValue = value.get('sky value');
            final width = MediaQuery.of(context).size.width;
            final rect = Rect.fromPoints(
              const Offset(0, 0),
              Offset(
                width,
                skyValue,
              ),
            );
            return SizedBox(
              width: width,
              height: skyValue,
              child: ClipRect(
                clipper: CustomRectClipper(rect),
                child: AnimatedMeshGradient(
                  colors: [
                    value.get('first color'),
                    value.get('second color'),
                    value.get('third color'),
                    value.get('fourth color'),
                  ],
                  seed: 300,
                  options: AnimatedMeshGradientOptions(
                    frequency: 0,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
