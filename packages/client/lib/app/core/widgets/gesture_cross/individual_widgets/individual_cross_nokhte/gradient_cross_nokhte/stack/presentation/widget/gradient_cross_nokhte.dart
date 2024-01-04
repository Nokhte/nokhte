import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:touchable/touchable.dart';
import 'canvas/gradient_cross_nokhte_painter.dart';

class GradientCrossNokhte extends StatelessWidget {
  final Size size;
  final GradientCrossNokhteStore store;
  final List<Offset> offsets;

  const GradientCrossNokhte({
    super.key,
    required this.store,
    required this.size,
    required this.offsets,
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
              painter: GradientCrossNokhtePainter(
                canvasSize: size,
                context: context,
                offsets: offsets,
                gradients: [
                  [
                    value.get('color1'),
                    value.get('color2'),
                    value.get('color3'),
                    value.get('color4'),
                  ]
                ],
                stops: [
                  [
                    value.get('stop1'),
                    value.get('stop2'),
                    value.get('stop3'),
                    value.get('stop4'),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
