// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/multiplying_nokhte_painter.dart';
import 'multiplying_nokhte.dart';
export 'movies/movies.dart';
export 'mobx/multiplying_nokhte_store.dart';
export 'types/types.dart';

class MultiplyingNokhte extends HookWidget {
  final MultiplyingNokhteStore store;
  const MultiplyingNokhte({
    super.key,
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
              child: CustomPaint(
                painter: MultiplyingNokhtePainter(
                    textOpacity: value.get("textOpacity"),
                    radii: [
                      value.get("rad1"),
                      value.get("rad2"),
                      value.get("rad3"),
                      value.get("rad4"),
                    ],
                    gradients: [
                      [value.get('g1c1'), value.get('g1c2')],
                      [value.get('g2c1'), value.get('g2c2')],
                      [value.get('g3c1'), value.get('g3c2')],
                      [value.get('g4c1'), value.get('g4c2')],
                    ],
                    symbols: store.symbols,
                    circleOffsets: [
                      Offset(value.get('dx1'), value.get('dy1')),
                      Offset(value.get('dx2'), value.get('dy2')),
                      Offset(value.get('dx3'), value.get('dy3')),
                      Offset(value.get('dx4'), value.get('dy4')),
                    ]
                    // circleOffsets: List.filled(4, Offset.zero),
                    ),
              ),
            ),
          )),
    );
  }
}
