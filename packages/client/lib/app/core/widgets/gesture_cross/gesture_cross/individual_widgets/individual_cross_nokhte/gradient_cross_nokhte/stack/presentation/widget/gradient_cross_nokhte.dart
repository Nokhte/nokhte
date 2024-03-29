import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/gesture_cross/stack/types/gradient_nokhte_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'canvas/gradient_cross_nokhte_painter.dart';

class GradientCrossNokhte extends StatelessWidget {
  final GradientCrossNokhteStore store;
  final List<GradientNokhteInformation> info;

  const GradientCrossNokhte({
    super.key,
    required this.store,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        onEnd: () => store.toggleHasFadedIn(),
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: SizedBox.expand(
          child: CustomPaint(
            painter: GradientCrossNokhtePainter(info),
          ),
        ),
      ),
    );
  }
}
