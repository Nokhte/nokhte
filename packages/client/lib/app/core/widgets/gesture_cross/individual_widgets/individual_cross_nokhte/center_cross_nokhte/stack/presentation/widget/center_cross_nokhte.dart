import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:touchable/touchable.dart';

import 'canvas/center_cross_nokhte_painter.dart';

class CenterCrossNokhte extends StatelessWidget {
  final CenterCrossNokhteStore store;
  const CenterCrossNokhte({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => CustomAnimationBuilder(
        tween: store.movie,
        duration: store.movie.duration,
        control: store.control,
        builder: (context, value, child) => SizedBox.expand(
          child: CanvasTouchDetector(
            gesturesToOverride: const [
              GestureType.onTapDown,
              GestureType.onTapUp,
            ],
            builder: (context) => CustomPaint(
              painter: CenterCrossNokhtePainter(
                radii: [
                  value.get('radii1'),
                  value.get('radii2'),
                ],
                offsets: [
                  Offset(value.get('dx1'), value.get('dy1')),
                  Offset(value.get('dx2'), value.get('dy2')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
