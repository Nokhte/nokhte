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
                  painter: ClockFacePainter(
                    props: ClockFacePainterProperties(
                      hourMarkLength:
                          value.get(ClockFaceMovieProperties.hourMarkLength),
                      three: ThreeProperties(
                        lineOneRotation: value.get(
                          ClockFaceMovieProperties.threeLineOneRotation,
                        ),
                        lineOneTranslation: value.get(
                          ClockFaceMovieProperties.threeLineOneTranslation,
                        ),
                        lineOneLength: value.get(
                          ClockFaceMovieProperties.threeLineOneLength,
                        ),
                        lineTwoRotation: value.get(
                          ClockFaceMovieProperties.threeLineTwoRotation,
                        ),
                        lineTwoTranslation: value.get(
                          ClockFaceMovieProperties.threeLineTwoTranslation,
                        ),
                        lineTwoLength: value.get(
                          ClockFaceMovieProperties.threeLineTwoLength,
                        ),
                        lineThreeRotation: value.get(
                          ClockFaceMovieProperties.threeLineThreeRotation,
                        ),
                        lineThreeTranslation: value.get(
                          ClockFaceMovieProperties.threeLineThreeTranslation,
                        ),
                        lineThreeLength: value.get(
                          ClockFaceMovieProperties.threeLineThreeLength,
                        ),
                      ),
                      six: SixProperties(
                        lineOneRotation: value.get(
                          ClockFaceMovieProperties.sixLineOneRotation,
                        ),
                        lineOneLength: value.get(
                          ClockFaceMovieProperties.sixLineOneLength,
                        ),
                        lineTwoLength: value.get(
                          ClockFaceMovieProperties.sixLineTwoLength,
                        ),
                        lineThreeLength: value.get(
                          ClockFaceMovieProperties.sixLineThreeLength,
                        ),
                        lineOneTranslation: value.get(
                          ClockFaceMovieProperties.sixLineOneTranslation,
                        ),
                        lineTwoRotation: value.get(
                          ClockFaceMovieProperties.sixLineTwoRotation,
                        ),
                        lineTwoTranslation: value.get(
                          ClockFaceMovieProperties.sixLineTwoTranslation,
                        ),
                        lineThreeRotation: value.get(
                          ClockFaceMovieProperties.sixLineThreeRotation,
                        ),
                        lineThreeTranslation: value.get(
                          ClockFaceMovieProperties.sixLineThreeTranslation,
                        ),
                      ),
                      nine: NineProperties(
                        lineOneRotation: value.get(
                          ClockFaceMovieProperties.nineLineOneRotation,
                        ),
                        lineOneTranslation: value.get(
                          ClockFaceMovieProperties.nineLineOneTranslation,
                        ),
                        lineTwoRotation: value.get(
                          ClockFaceMovieProperties.nineLineTwoRotation,
                        ),
                        lineTwoTranslation: value.get(
                          ClockFaceMovieProperties.nineLineTwoTranslation,
                        ),
                        lineThreeRotation: value.get(
                          ClockFaceMovieProperties.nineLineThreeRotation,
                        ),
                        lineThreeTranslation: value.get(
                          ClockFaceMovieProperties.nineLineThreeTranslation,
                        ),
                        lineOneLength: value.get(
                          ClockFaceMovieProperties.nineLineOneLength,
                        ),
                        lineTwoLength: value.get(
                          ClockFaceMovieProperties.nineLineTwoLength,
                        ),
                        lineThreeLength: value.get(
                          ClockFaceMovieProperties.nineLineThreeLength,
                        ),
                      ),
                      twelve: TwelveProperties(
                        lineOneRotation: value.get(
                          ClockFaceMovieProperties.twelveLineOneRotation,
                        ),
                        lineOneTranslation: value.get(
                          ClockFaceMovieProperties.twelveLineOneTranslation,
                        ),
                        lineTwoRotation: value.get(
                          ClockFaceMovieProperties.twelveLineTwoRotation,
                        ),
                        lineTwoTranslation: value.get(
                          ClockFaceMovieProperties.twelveLineTwoTranslation,
                        ),
                        lineThreeRotation: value.get(
                          ClockFaceMovieProperties.twelveLineThreeRotation,
                        ),
                        lineThreeTranslation: value.get(
                          ClockFaceMovieProperties.twelveLineThreeTranslation,
                        ),
                        lineFourTranslation: value.get(
                          ClockFaceMovieProperties.twelveLineFourTranslation,
                        ),
                        lineFourRotation: value.get(
                          ClockFaceMovieProperties.twelveLineFourRotation,
                        ),
                        lineOneLength: value.get(
                          ClockFaceMovieProperties.twelveLineOneLength,
                        ),
                        lineTwoLength: value.get(
                          ClockFaceMovieProperties.twelveLineTwoLength,
                        ),
                        lineThreeLength: value.get(
                          ClockFaceMovieProperties.twelveLineThreeLength,
                        ),
                        lineFourLength: value.get(
                          ClockFaceMovieProperties.twelveLineFourLength,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
}
