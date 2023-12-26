import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'canvas/dumb_gradient_circle_painter.dart';

class DumbGradientCircle extends StatelessWidget {
  final ModelGradientOptions gradient;
  final DumbGradientCircleStore store;
  final double bottomPadding;
  const DumbGradientCircle({
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
            child: FullScreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    painter: DumbGradientCirclePainter(
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
          ));
}
