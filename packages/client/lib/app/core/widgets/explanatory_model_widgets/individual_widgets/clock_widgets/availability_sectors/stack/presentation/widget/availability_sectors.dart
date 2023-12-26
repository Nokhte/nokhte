import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

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
              builder: (context, value, child) => FullScreen(
                child: CustomPaint(
                  painter: AvailabilitySectorsPainter(
                    sectorLength: value.get('sectorLength'),
                  ),
                ),
              ),
            ),
          ));
}
