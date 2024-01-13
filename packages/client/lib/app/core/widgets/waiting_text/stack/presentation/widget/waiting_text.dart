import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/waiting_text_painter.dart';

class WaitingText extends HookWidget {
  final WaitingTextStore store;
  const WaitingText({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: Seconds.get(0, milli: 500),
          child: CustomAnimationBuilder(
              tween: store.altMovie,
              duration: store.altMovie.duration,
              control: store.altControl,
              builder: (context, secondaryValue, child) {
                return CustomAnimationBuilder(
                  tween: store.movie,
                  duration: store.movie.duration,
                  control: store.control,
                  onCompleted: () => store.onCompleted(),
                  builder: (context, primaryValue, child) => HookBuilder(
                    builder: (context) => Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: useFullScreenSize().width * .01,
                          right: useFullScreenSize().width * .01,
                        ),
                        child: Stack(
                          children: [
                            CustomPaint(
                              size: useFullScreenSize(),
                              painter: WaitingTextPainter(
                                rectColor: secondaryValue.get('rectColor'),
                                ripple1Color:
                                    secondaryValue.get('ripple1Color'),
                                ripple2Color:
                                    secondaryValue.get('ripple2Color'),
                                ripple1: OpacityAndRadius(
                                  opacity:
                                      primaryValue.get('ripple1Arc1Opacity'),
                                  radius: primaryValue.get('ripple1Arc1Radius'),
                                ),
                                ripple2: OpacityAndRadius(
                                  opacity:
                                      primaryValue.get('ripple1Arc2Opacity'),
                                  radius: primaryValue.get('ripple1Arc2Radius'),
                                ),
                                circleXOffset:
                                    primaryValue.get('circleXOffset'),
                                circleYOffset:
                                    primaryValue.get('circleYOffset'),
                                circleRadius: primaryValue.get('circleRadius'),
                                circleOpacity:
                                    primaryValue.get('circleOpacity'),
                                rectOpacity: primaryValue.get('rectOpacity'),
                                roundness: primaryValue.get('roundness'),
                                topLengthScalar:
                                    primaryValue.get('topLengthScalar'),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: useFullScreenSize().height * .25),
                                child: Text(
                                  "WAIT NG",
                                  style: GoogleFonts.jost(
                                    fontSize: useFullScreenSize().width * .15,
                                    color: secondaryValue.get('rectColor'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
}
