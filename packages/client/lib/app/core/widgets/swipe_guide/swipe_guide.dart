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
export 'mixin/mixin.dart';
export 'canvas/swipe_guide_painter.dart';
export 'movies/movies.dart';
export 'types/swipe_guide_orientation.dart';
export 'mobx/swipe_guide_store.dart';

class SwipeGuide extends HookWidget with SwipeGuideUtils {
  final SwipeGuideStore store;
  final List<SwipeGuideOrientation> orientations;
  const SwipeGuide({
    super.key,
    required this.store,
    required this.orientations,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();

    return Observer(builder: (context) {
      return AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: Seconds.get(1),
          child: CustomAnimationBuilder(
              tween: store.movie,
              duration: store.movie.duration,
              control: store.control,
              builder: (context, value, child) {
                return Stack(
                  children: buildGuides(
                    value,
                    screenSize,
                    orientations,
                  ),
                );
              }));
    });
  }
}
