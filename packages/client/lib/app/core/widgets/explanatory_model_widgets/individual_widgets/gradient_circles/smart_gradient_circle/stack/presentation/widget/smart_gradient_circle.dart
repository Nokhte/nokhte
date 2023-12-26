import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'canvas/smart_gradient_circle_painter.dart';

class SmartGradientCircle extends StatelessWidget {
  final ModelGradientOptions gradient;
  final SmartGradientCircleStore store;
  final double bottomPadding;
  const SmartGradientCircle({
    super.key,
    required this.store,
    required this.gradient,
    this.bottomPadding = 0,
  });

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => AnimatedOpacity(
            onEnd: () => store.toggleHasFadedIn(),
            opacity: useWidgetOpacity(store.showWidget),
            duration: Seconds.get(1),
            child: CustomAnimationBuilder(
              tween: store.movie,
              duration: store.movie.duration,
              control: store.control,
              builder: (context, value, child) => FullScreen(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      painter: SmartGradientCirclePainter(
                        gradient: gradient,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: bottomPadding,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
