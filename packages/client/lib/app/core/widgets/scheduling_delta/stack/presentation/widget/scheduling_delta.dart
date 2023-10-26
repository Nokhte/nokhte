import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/scheduling_delta_painter.dart';

class SchedulingDelta extends StatelessWidget {
  final SchedulingDeltaStore trackerStore;
  const SchedulingDelta({
    super.key,
    required this.trackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: trackerStore.showWidget ? 1 : 0,
        duration: Seconds.get(2),
        child: CustomAnimationBuilder(
            tween: trackerStore.movie,
            control: trackerStore.control,
            duration: trackerStore.movie.duration,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 100.0, right: 50),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: CustomPaint(
                    painter: SchedulingDeltaPainter(
                      path: SvgAnimtionCostants.schedulingDeltaPath,
                      deltaColor: value.get('color'),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
