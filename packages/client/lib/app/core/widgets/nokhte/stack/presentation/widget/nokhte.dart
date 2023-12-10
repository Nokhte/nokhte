import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/nokhte/stack/presentation/mobx/nokhte_store.dart';
import 'package:nokhte/app/core/widgets/nokhte/stack/presentation/widget/canvas/nokhte_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class Nokhte extends HookWidget {
  final NokhteStore store;
  const Nokhte({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(0, milli: 500),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          onCompleted: () => store.onCompleted(),
          control: store.control,
          builder: (context, value, child) {
            return CustomPaint(
              painter: NokhtePainter(
                nokhteCoordinates:
                    Offset(value.get('nokhteX'), value.get('nokhteY')),
                blueDotCoordinates:
                    Offset(value.get('blueX'), value.get('blueY')),
              ),
              size: MediaQuery.of(context).size,
            );
          },
        ),
      ),
    );
  }
}
