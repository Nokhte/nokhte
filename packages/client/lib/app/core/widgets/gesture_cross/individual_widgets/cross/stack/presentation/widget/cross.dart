// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:touchable/touchable.dart';
import 'canvas/cross_painter.dart';

class Cross extends StatelessWidget {
  final Size size;
  final CrossStore store;
  const Cross({
    super.key,
    required this.size,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          onCompleted: () => store.onCompleted(),
          builder: (context, value, child) => SizedBox.expand(
            child: CanvasTouchDetector(
              gesturesToOverride: const [
                GestureType.onTapDown,
                GestureType.onTapUp,
              ],
              builder: (context) => CustomPaint(
                painter: CrossPainter(
                  context,
                  store.path,
                  store.bounds,
                  size,
                  onTap: store.incrementTapCount,
                  crossGradient: ColorsAndStops(colors: [
                    const Color(0xFF0A98FF),
                    Colors.white.withOpacity(0)
                  ], stops: const [
                    0,
                    .5
                  ]),
                  circleInformation: store.circleInformation,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
