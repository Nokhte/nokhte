// ignore_for_file: library_private_types_in_public_api
import 'package:dartz/dartz.dart';
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
  final GestureCrossStore stateTrackerStore;
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
              padding: const EdgeInsets.only(left: 10.0),
              child: CustomPaint(
                painter: GestureCrossPainter(
                  SvgAnimtionConstants.crossPath,
                  size,
                  SvgAnimtionConstants.crossPath.getBounds(),
                  crossGradient: ColorsAndStops(colors: [
                    const Color(0xFF0A98FF),
                    Colors.white.withOpacity(0)
                  ], stops: const [
                    0,
                    .5
                  ]),
                  circleInformation: [
                    //bottom
                    const CircleInformation(
                      colorOrGradient: Left(Colors.white),
                      offset: Offset(0, 12),
                    ),
                    // center
                    const CircleInformation(
                      colorOrGradient: Left(Colors.white),
                      offset: Offset(0, 35),
                    ),
                    // left
                    const CircleInformation(
                      colorOrGradient: Left(Colors.white),
                      offset: Offset(23, 35),
                    ),
                    // right
                    const CircleInformation(
                      colorOrGradient: Left(Colors.white),
                      offset: Offset(-23, 35),
                    ),
                    // top
                    const CircleInformation(
                      colorOrGradient: Left(Colors.white),
                      offset: Offset(0, 57),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
