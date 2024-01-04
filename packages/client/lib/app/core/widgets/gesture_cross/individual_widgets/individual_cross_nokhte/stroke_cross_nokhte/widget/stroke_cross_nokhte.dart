import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

import 'canvas/stroke_cross_nokhte_painter.dart';

class StrokeCrossNokhte extends StatelessWidget {
  final List<Offset> offsets;

  const StrokeCrossNokhte({
    super.key,
    required this.offsets,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CanvasTouchDetector(
          gesturesToOverride: const [
            GestureType.onTapDown,
            GestureType.onTapUp,
          ],
          builder: (context) => CustomPaint(
                painter: StrokeCrossNokhtePainter(
                  context: context,
                  offsets: offsets,
                ),
              )),
    );
  }
}
