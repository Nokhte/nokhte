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
export 'types/swipe_guide_orientation.dart';
export 'mobx/swipe_guide_store.dart';

class SwipeGuide extends HookWidget {
  final SwipeGuideStore store;
  final SwipeGuideOrientation orientation;
  const SwipeGuide({
    super.key,
    required this.store,
    required this.orientation,
  });

  double getRightPadding(Size screenSize) {
    if (orientation == SwipeGuideOrientation.right) {
      return screenSize.width * 0;
    } else if (orientation == SwipeGuideOrientation.left) {
      return screenSize.width * .15;
    } else if (orientation == SwipeGuideOrientation.top) {
      return screenSize.aspectRatio >= 0.56
          ? screenSize.width * .01
          : screenSize.width * .02;
    } else {
      return 0;
    }
  }

  double getLeftPadding(Size screenSize) {
    if (orientation == SwipeGuideOrientation.left) {
      return screenSize.width * 0;
    } else if (orientation == SwipeGuideOrientation.right) {
      return screenSize.width * .15;
    } else {
      return 0;
    }
  }

  double getBottomPadding(Size screenSize) {
    if (orientation == SwipeGuideOrientation.left ||
        orientation == SwipeGuideOrientation.right) {
      return screenSize.aspectRatio >= 0.56
          ? screenSize.height * .08
          : screenSize.height * .02;
    } else if (orientation == SwipeGuideOrientation.top) {
      return screenSize.aspectRatio >= 0.56
          ? screenSize.height * .13
          : screenSize.height * .08;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    double containerSize = screenSize.height * .3;
    if (orientation == SwipeGuideOrientation.top) {
      containerSize = screenSize.height * .25;
    }
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          builder: (context, value, child) => Center(
            child: Padding(
              padding: EdgeInsets.only(
                right: getRightPadding(screenSize),
                bottom: getBottomPadding(screenSize),
                left: getLeftPadding(screenSize),
              ),
              child: SizedBox(
                height: containerSize,
                width: containerSize,
                child: CustomPaint(
                  painter: SwipeGuidePainter(
                    orientation: orientation,
                    opacities: [
                      value.get('o7'),
                      value.get('o6'),
                      value.get('o5'),
                      value.get('o4'),
                      value.get('o3'),
                      value.get('o2'),
                      value.get('o1'),
                    ],
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
