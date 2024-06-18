import 'package:flutter/material.dart';
import 'flexible_seating_icon_painter.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'flexible_seating_movie.dart';

class FlexibleSeatingIcon extends StatelessWidget {
  final double containerSize;
  final bool shouldAnimate;
  const FlexibleSeatingIcon({
    super.key,
    required this.containerSize,
    required this.shouldAnimate,
  });

  @override
  build(context) => CustomAnimationBuilder(
        tween: shouldAnimate
            ? FlexibleSeatingMovie.active
            : FlexibleSeatingMovie.static,
        duration: shouldAnimate
            ? FlexibleSeatingMovie.active.duration
            : FlexibleSeatingMovie.static.duration,
        control: shouldAnimate ? Control.loop : Control.stop,
        builder: (context, value, child) {
          return SizedBox(
            height: containerSize * .23,
            width: containerSize * .23,
            child: CustomPaint(
              painter: FlexibleSeatingIconPainter(
                containerSize: containerSize,
                o1: value.get('o1'),
                o2: value.get('o2'),
                o3: value.get('o3'),
              ),
            ),
          );
        },
      );
}
