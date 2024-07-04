// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'canvas/preset_diagram_painter.dart';
export 'movies/preset_diagram_movies.dart';
export 'mobx/preset_diagram_store.dart';
export 'constants/constants.dart';
export 'types/types.dart';

class PresetDiagam extends StatelessWidget {
  final PresetDiagramStore store;
  const PresetDiagam({
    super.key,
    required this.store,
  });

  List<Offset> getCircleOffsets(Movie value, int numOfCircles) {
    final List<Offset> temp = [];
    for (int i = 0; i < numOfCircles; i++) {
      temp.add(Offset(
        value.get('c${i + 1}.dx'),
        value.get('c${i + 1}.dy'),
      ));
    }
    return temp;
  }

  List<double> getCircleStops(Movie value, int numOfCircles) {
    List<double> temp = [];
    for (int i = 0; i < numOfCircles; i++) {
      temp = [
        value.get('c1.st1'),
        value.get('c1.st2'),
        value.get('c1.st3'),
        value.get('c1.st4'),
        value.get('c1.st5'),
        value.get('c1.st6'),
        value.get('c1.st7'),
        value.get('c1.st8'),
      ];
    }
    return temp;
  }

  List<Color> getCircleColors(Movie value, int numOfCircles) => [
        value.get('c1.co1'),
        value.get('c1.co2'),
        value.get('c1.co3'),
        value.get('c1.co4'),
        value.get('c1.co5'),
        value.get('c1.co6'),
        value.get('c1.co7'),
        value.get('c1.co8'),
      ];

  List<double> getLineWidths(Movie value, int numOfLines) {
    final List<double> temp = [];
    for (int i = 0; i < numOfLines; i++) {
      temp.add(value.get('l${i + 1}.width'));
    }
    return temp;
  }

  List<List<Offset>> getLineOffsets(Movie value, int numOfLines) {
    final List<List<Offset>> temp = [];
    for (int i = 0; i < numOfLines; i++) {
      temp.add([
        Offset(
          value.get('l${i + 1}.dx.start'),
          value.get('l${i + 1}.dy.start'),
        ),
        Offset(
          value.get('l${i + 1}.dx.end'),
          value.get('l${i + 1}.dy.end'),
        ),
      ]);
    }
    return temp;
  }

  List<double> getCircleRadii(Movie value, int numOfCircles) {
    final List<double> temp = [];
    for (int i = 0; i < numOfCircles; i++) {
      temp.add(value.get('c${i + 1}.rad'));
    }
    return temp;
  }

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
            builder: (context, value, child) => Stack(
              children: [
                FullScreen(
                  child: CustomPaint(
                    painter: PresetDiagramPainter(
                      circleColors: getCircleColors(value, store.numOfCircles),
                      circleStops: getCircleStops(value, store.numOfCircles),
                      lineGradAlignments: store.lineGradAlignments,
                      lineWidth: getLineWidths(value, store.numOfLines),
                      lineOffsets: getLineOffsets(value, store.numOfLines),
                      circleOffsets:
                          getCircleOffsets(value, store.numOfCircles),
                      radii: getCircleRadii(value, store.numOfCircles),
                      lineGradTypes: store.lineGrads,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
