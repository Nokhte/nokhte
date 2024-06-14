import 'package:flutter/material.dart';
import 'strict_seating_icon_painter.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'strict_seating_movie.dart';

class StrictSeatingIcon extends StatelessWidget {
  const StrictSeatingIcon({super.key});

  @override
  build(context) => LoopAnimationBuilder(
        tween: StrictSeatingMovie.movie,
        duration: StrictSeatingMovie.movie.duration,
        builder: (context, value, child) {
          return FullScreen(
            child: CustomPaint(
              painter: StrictSeatingIconPainter(
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
      );
}
