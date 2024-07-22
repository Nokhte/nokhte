// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'preset_diagram.dart';
export 'canvas/preset_diagram_painter.dart';
export 'movies/preset_diagram_movies.dart';
export './utils/utils.dart';
export 'mobx/preset_diagram_store.dart';
export 'constants/constants.dart';
export 'types/types.dart';

class PresetDiagam extends HookWidget with PresetDiagramUtils {
  final PresetDiagramStore store;
  const PresetDiagam({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    final padding = useScaledSize(
      baseValue: .04,
      bumpPerHundredth: .003,
      screenSize: screenSize,
    );
    return Observer(
      builder: (context) => AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: Seconds.get(1),
          child: CustomAnimationBuilder(
            tween: store.movie,
            duration: store.movie.duration,
            control: store.control,
            onCompleted: () => store.onCompleted(),
            builder: (context, value, child) => FullScreen(
              child: CustomPaint(
                painter: PresetDiagramPainter(
                  bottomPadding: padding,
                  circleColors: getCircleColors(value, store.numOfCircles),
                  circleStops: getCircleStops(value, store.numOfCircles),
                  lineGradAlignments: store.lineGradAlignments,
                  lineWidth: getLineWidths(value, store.numOfLines),
                  lineOffsets:
                      getLineOffsets(value, store.numOfLines, screenSize),
                  circleOffsets:
                      getCircleOffsets(value, store.numOfCircles, screenSize),
                  radii: getCircleRadii(value, store.numOfCircles),
                  lineGradTypes: store.lineGrads,
                ),
              ),
            ),
          )),
    );
  }
}
