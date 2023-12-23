import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'canvas/clock_face_painter.dart';

class ClockFace extends StatelessWidget {
  final ClockFaceStore store;
  const ClockFace({
    super.key,
    required this.store,
  });
  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => AnimatedOpacity(
            opacity: useWidgetOpacity(store.showWidget),
            duration: Seconds.get(1),
            child: CustomAnimationBuilder(
              tween: store.movie,
              duration: store.movie.duration,
              control: store.control,
              builder: (context, value, child) => FullScreen(
                child: CustomPaint(
                  painter: ClockFacePainter(),
                ),
              ),
            ),
          ));
}
