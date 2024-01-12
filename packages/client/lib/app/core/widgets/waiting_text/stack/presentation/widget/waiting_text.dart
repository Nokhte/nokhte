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
            tween: store.movie,
            duration: store.movie.duration,
            control: store.control,
            onCompleted: () => store.onCompleted(),
            builder: (context, value, child) => HookBuilder(
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
                          ripple1Arc1:
                              // OpacityAndRadius(opacity: 0, radius: 0),

                              OpacityAndRadius(
                            opacity: value.get('ripple1Arc1Opacity'),
                            radius: value.get('ripple1Arc1Radius'),
                          ),
                          ripple1Arc2:
                              // OpacityAndRadius(opacity: 0, radius: 0),
                              OpacityAndRadius(
                            opacity: value.get('ripple1Arc2Opacity'),
                            radius: value.get('ripple1Arc2Radius'),
                          ),
                          ripple1Arc3: OpacityAndRadius(opacity: 0, radius: 0),
                          circleXOffset: value.get('circleXOffset'),
                          circleYOffset: value.get('circleYOffset'),
                          circleRadius: value.get('circleRadius'),
                          circleOpacity: value.get('circleOpacity'),
                          rectOpacity: value.get('rectOpacity'),
                          roundness: value.get('roundness'),
                          topLengthScalar: value.get('topLengthScalar'),
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
