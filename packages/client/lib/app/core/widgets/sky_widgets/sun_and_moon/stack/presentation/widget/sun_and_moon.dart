import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/presentation/widget/canvas/sun_and_moon_painter.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/sun_and_moon.dart';
import 'package:simple_animations/simple_animations.dart';

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
