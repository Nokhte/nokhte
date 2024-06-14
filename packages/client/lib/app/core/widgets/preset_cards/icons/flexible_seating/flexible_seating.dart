import 'package:flutter/material.dart';
import 'flexible_seating_icon_painter.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'flexible_seating_movie.dart';

class FlexibleSeatingIcon extends StatelessWidget {
  const FlexibleSeatingIcon({super.key});

  @override
  build(context) => LoopAnimationBuilder(
        tween: FlexibleSeatingMovie.movie,
        duration: FlexibleSeatingMovie.movie.duration,
        builder: (context, value, child) {
          return FullScreen(
            child: CustomPaint(
              painter: FlexibleSeatingIconPainter(
                o1: value.get('o1'),
                o2: value.get('o2'),
                o3: value.get('o3'),
              ),
            ),
          );
        },
      );
}
