import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'canvas/touch_ripple_painter.dart';

class TouchRipple extends StatelessWidget {
  final TouchRippleStore store;
  const TouchRipple({
    super.key,
    required this.store,
  });

  _returnRipples() {
    List<Widget> temp = [];
    for (int i = 0; i < store.info.length; i++) {
      final ripple = store.info[i];
      final isLastOne = i == store.info.length - 1;
      temp.add(
        CustomAnimationBuilder(
          tween: ripple.movie,
          duration: ripple.movie.duration,
          control: ripple.control,
          onCompleted: () => isLastOne ? store.onCompleted() : null,
          builder: (context, value, __) => CustomPaint(
            painter: TouchRipplePainter(
              position: ripple.position,
              firstCircle: OpacityAndRadius(
                radius: value.get(TouchRippleMovieProps.circle1Radius),
                opacity: value.get(TouchRippleMovieProps.circle1Opacity),
              ),
              secondCircle: OpacityAndRadius(
                radius: value.get(TouchRippleMovieProps.circle2Radius),
                opacity: value.get(TouchRippleMovieProps.circle2Opacity),
              ),
              thirdCircle: OpacityAndRadius(
                radius: value.get(TouchRippleMovieProps.circle3Radius),
                opacity: value.get(TouchRippleMovieProps.circle3Opacity),
              ),
            ),
          ),
        ),
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Stack(
          children: _returnRipples(),
        ),
      );
}
