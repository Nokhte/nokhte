// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/swipe_guide_painter.dart';
export 'movies/movies.dart';
export 'mobx/swipe_guide_store.dart';

class SwipeGuide extends HookWidget {
  final SwipeGuideStore store;
  final bool toTheRight;
  const SwipeGuide({
    super.key,
    required this.store,
    required this.toTheRight,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    final containerSize = screenSize.height * .3;
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          builder: (context, value, child) => Padding(
            padding: EdgeInsets.only(
              right: toTheRight ? 0 : screenSize.width * .15,
              bottom: screenSize.height * .02,
              left: toTheRight ? screenSize.width * .15 : 0,
            ),
            child: Center(
              child: SizedBox(
                height: containerSize,
                width: containerSize,
                child: CustomPaint(
                  painter: SwipeGuidePainter(
                    toTheRight: toTheRight,
                    opacities: [
                      value.get('o7'),
                      value.get('o6'),
                      value.get('o5'),
                      value.get('o4'),
                      value.get('o3'),
                      value.get('o2'),
                      value.get('o1'),
                    ],
                    containerSize: containerSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
