// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/perspectives_map_painter.dart';

class PerspectivesMap extends StatelessWidget {
  final Size size;
  final PerspectivesMapStore stateTrackerStore;
  const PerspectivesMap({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: stateTrackerStore.showWidget ? 1 : 0,
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: stateTrackerStore.movie,
          duration: stateTrackerStore.movie.duration,
          control: stateTrackerStore.control,
          builder: (context, value, child) => Container(
            alignment: Alignment.topLeft,
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 60.0),
              child: CustomPaint(
                painter: PerspectivesMapPainter(
                  SvgAnimtionConstants.fiveCirclePlatformPath,
                  size,
                  SvgAnimtionConstants.fiveCirclePlatformPath.getBounds(),
                  platformGradColors: [
                    const Color(0xFF0A98FF),
                    const Color(0x00FFFFFF),
                  ],
                  circleColors: [
                    value.get('leftMostCircleColor'),
                    value.get('leftCircleColor'),
                    value.get('centerCircleColor'),
                    value.get('rightCircleColor'),
                    value.get('rightMostCircleColor'),
                  ],
                  circleVertOffsets: [
                    value.get('leftMostCircleVertOffset'),
                    value.get('leftCircleVertOffset'),
                    value.get('centerCircleVertOffset'),
                    value.get('rightCircleVertOffset'),
                    value.get('rightMostCircleVertOffset'),
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
