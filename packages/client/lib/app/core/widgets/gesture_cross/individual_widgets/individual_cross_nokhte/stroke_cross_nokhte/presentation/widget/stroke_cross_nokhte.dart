import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:touchable/touchable.dart';

import 'canvas/stroke_cross_nokhte_painter.dart';

class StrokeCrossNokhte extends StatelessWidget {
  final List<Offset> offsets;
  final StrokeCrossNokhteStore store;

  const StrokeCrossNokhte({
    super.key,
    required this.offsets,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SizedBox.expand(
        child: AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          onEnd: () => store.toggleHasFadedIn(),
          duration: Seconds.get(1),
          child: CanvasTouchDetector(
              gesturesToOverride: const [
                GestureType.onTapDown,
                GestureType.onTapUp,
              ],
              builder: (context) => CustomPaint(
                    painter: StrokeCrossNokhtePainter(
                      context: context,
                      offsets: offsets,
                      onTap: () => store.incrementTapCount(),
                    ),
                  )),
        ),
      );
    });
  }
}
