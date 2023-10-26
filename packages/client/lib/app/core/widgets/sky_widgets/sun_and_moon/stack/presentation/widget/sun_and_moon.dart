import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/sun_and_moon_painter.dart';

class SunAndMoon extends StatelessWidget {
  final SunAndMoonStore stateTrackerStore;
  const SunAndMoon({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder(
        tween: stateTrackerStore.movie,
        duration: stateTrackerStore.movie.duration,
        control: stateTrackerStore.control,
        builder: (context, value, child) {
          return CustomPaint(
            painter: SunAndMoonPainter(
              isTheMoon: stateTrackerStore.isTheMoon,
              verticalConstant: value.get('vertical constant'),
              colorGrad: [
                value.get("first grad color"),
                value.get("second grad color"),
              ],
            ),
          );
        },
      );
    });
  }
}
