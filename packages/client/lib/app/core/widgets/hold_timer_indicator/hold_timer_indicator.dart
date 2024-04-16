// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/hold_timer_indicator_painter.dart';
export 'movies/arc_to_circle_movie.dart';
export 'mobx/hold_timer_indicator_store.dart';

class HoldTimerIndicator extends StatelessWidget {
  final HoldTimerIndicatorStore store;
  const HoldTimerIndicator({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          builder: (context, value, child) => SizedBox.expand(
            child: CustomPaint(
              painter: HoldTimerIndicatorPainter(
                sweep: value.get('sweep'),
                grad: store.gradient,
              ),
            ),
          ),
        ),
      );
    });
  }
}
