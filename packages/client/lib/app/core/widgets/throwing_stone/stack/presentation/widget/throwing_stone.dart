import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/throwing_stone_painter.dart';

class ThrowingStone extends StatelessWidget {
  final ThrowingStoneStore store;
  const ThrowingStone({
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
        builder: (_, value, __) => CustomPaint(
          painter: ThrowingStonePainter(),
        ),
      ),
    );
  }
}
