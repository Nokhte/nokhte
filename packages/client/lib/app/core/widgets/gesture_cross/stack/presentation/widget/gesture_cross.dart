// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/gesture_cross_painter.dart';

class GestureCross extends StatelessWidget {
  final Size size;
  final GesturePillStore stateTrackerStore;
  const GestureCross({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => CustomAnimationBuilder(
        tween: stateTrackerStore.movie,
        duration: stateTrackerStore.movie.duration,
        control: stateTrackerStore.pillController,
        onCompleted: () => stateTrackerStore.onAnimationCompleted(),
        builder: (context, value, child) => AnimatedOpacity(
          opacity: useWidgetOpacity(stateTrackerStore.showWidget),
          duration: Seconds.get(1),
          child: Container(
            alignment: Alignment.topLeft,
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomPaint(
                painter: GestureCrossPainter(
                  SvgAnimtionConstants.crossPath,
                  size,
                  SvgAnimtionConstants.crossPath.getBounds(),
                  centerCircleOpacity: value.get('center circle opacity'),
                  firstGradientColor: value.get('first gradient color'),
                  secondGradientColor: value.get('second gradient color'),
                  upperCircleLinearGradient: [
                    value.get('top circle color 1'),
                    value.get('top circle color 2'),
                  ],
                  centerCircleAnimationConstant:
                      value.get('center circle constant'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
