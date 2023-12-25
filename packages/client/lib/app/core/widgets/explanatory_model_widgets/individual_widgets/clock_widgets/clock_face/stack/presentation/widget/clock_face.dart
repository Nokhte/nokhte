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
                      three: BaseHourMarkProperties(
                        lengths: [
                          value.get(
                            ClockFaceMovieProperties.threeLineOneLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.threeLineTwoLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.threeLineThreeLength,
                          ),
                        ],
                        rotations: [
                          value.get(
                            ClockFaceMovieProperties.threeLineOneRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.threeLineTwoRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.threeLineThreeRotation,
                          ),
                        ],
                        translations: [
                          value.get(
                            ClockFaceMovieProperties.threeLineOneTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.threeLineTwoTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.threeLineThreeTranslation,
                          ),
                        ],
                      ),
                      six: BaseHourMarkProperties(
                        lengths: [
                          value.get(
                            ClockFaceMovieProperties.sixLineOneLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.sixLineTwoLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.sixLineThreeLength,
                          ),
                        ],
                        rotations: [
                          value.get(
                            ClockFaceMovieProperties.sixLineOneRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.sixLineTwoRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.sixLineThreeRotation,
                          ),
                        ],
                        translations: [
                          value.get(
                            ClockFaceMovieProperties.sixLineOneTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.sixLineTwoTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.sixLineThreeTranslation,
                          ),
                        ],
                      ),
                      nine: BaseHourMarkProperties(
                        lengths: [
                          value.get(
                            ClockFaceMovieProperties.nineLineOneLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.nineLineTwoLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.nineLineThreeLength,
                          ),
                        ],
                        rotations: [
                          value.get(
                            ClockFaceMovieProperties.nineLineOneRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.nineLineTwoRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.nineLineThreeRotation,
                          ),
                        ],
                        translations: [
                          //
                          value.get(
                            ClockFaceMovieProperties.nineLineOneTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.nineLineTwoTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.nineLineThreeTranslation,
                          ),
                        ],
                      ),
                      twelve: BaseHourMarkProperties(
                        lengths: [
                          value.get(
                            ClockFaceMovieProperties.twelveLineOneLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineTwoLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineThreeLength,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineFourLength,
                          ),
                        ],
                        rotations: [
                          value.get(
                            ClockFaceMovieProperties.twelveLineOneRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineTwoRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineThreeRotation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineFourRotation,
                          ),
                        ],
                        translations: [
                          value.get(
                            ClockFaceMovieProperties.twelveLineOneTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineTwoTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineThreeTranslation,
                          ),
                          value.get(
                            ClockFaceMovieProperties.twelveLineFourTranslation,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
}
