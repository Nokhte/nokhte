import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'strict_seating_icon_painter.dart';
import 'package:simple_animations/simple_animations.dart';
export 'strict_seating_movie.dart';

class StrictSeatingIcon extends StatelessWidget {
  final double opacity;
  final double containerSize;
  final bool shouldAnimate;
  const StrictSeatingIcon({
    super.key,
    required this.opacity,
    required this.containerSize,
    required this.shouldAnimate,
  });

  @override
  build(context) => Opacity(
        opacity: opacity,
        child: CustomAnimationBuilder(
          tween: shouldAnimate
              ? StrictSeatingMovie.active
              : StrictSeatingMovie.static,
          duration: shouldAnimate
              ? StrictSeatingMovie.active.duration
              : StrictSeatingMovie.static.duration,
          control: shouldAnimate ? Control.loop : Control.stop,
          builder: (context, value, child) {
            return SizedBox(
              height: containerSize * .23,
              width: containerSize * .23,
              child: CustomPaint(
                painter: StrictSeatingIconPainter(
                  containerSize: containerSize,
                  top: Offset(
                    value.get('top.dx'),
                    value.get('top.dy'),
                  ),
                  right: Offset(
                    value.get('right.dx'),
                    value.get('right.dy'),
                  ),
                  bottom: Offset(
                    value.get('bottom.dx'),
                    value.get('bottom.dy'),
                  ),
                  left: Offset(
                    value.get('left.dx'),
                    value.get('left.dy'),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
