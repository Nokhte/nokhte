import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:touchable/touchable.dart';

import 'canvas/availability_sectors_painter.dart';

class AvailabilitySectors extends StatelessWidget {
  final AvailabilitySectorsStore store;
  const AvailabilitySectors({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: Seconds.get(0, milli: 500),
          child: CustomAnimationBuilder(
            tween: store.movie,
            duration: store.movie.duration,
            control: store.control,
            onCompleted: () => store.onCompleted(),
            builder: (context, value, child) => FullScreen(
              child: SizedBox.expand(
                child: CanvasTouchDetector(
                    gesturesToOverride: const [
                      GestureType.onTapDown,
                      GestureType.onTapUp,
                    ],
                    builder: (context) {
                      return CustomPaint(
                        painter: AvailabilitySectorsPainter(
                          touchCallback: () => store.initJoinAndFadeOutMovie(),
                          context: context,
                          redSectorLengths:
                              SectorAnimationUtils.getRedSectorLengths(
                            value,
                          ),
                          redSectorGradients:
                              SectorAnimationUtils.getRedSectorGradients(value),
                          redSectorRadii:
                              SectorAnimationUtils.getRedSectorRadii(value),
                          blueSectorLengths:
                              SectorAnimationUtils.getBlueSectorLengths(value),
                          blueSectorGradients:
                              SectorAnimationUtils.getBlueSectorGradients(
                                  value),
                          blueSectorRadii:
                              SectorAnimationUtils.getBlueSectorRadii(value),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      );
}
