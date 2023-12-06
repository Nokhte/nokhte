import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/conveyer_belt_text/stack/presentation/presentation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

class ConveyerBeltText extends StatelessWidget {
  final ConveyerBeltTextStore trackerStore;
  final Size size;
  const ConveyerBeltText({
    super.key,
    required this.size,
    required this.trackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AnimatedOpacity(
            opacity: trackerStore.showWidget ? 1 : 0,
            duration: Seconds.get(2),
            child: CustomAnimationBuilder(
                onCompleted: () => trackerStore.onCompletedMovie(),
                control: trackerStore.control,
                tween: trackerStore.movie,
                duration: trackerStore.movie.duration,
                builder: (context, value, child) {
                  return Stack(clipBehavior: Clip.none, children: [
                    for (int i = 0; i < 5; i++)
                      Positioned(
                        left: value.get('$i left position'),
                        top: value.get('$i top position'),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: trackerStore.uiArray[i].gradient,
                              stops: const [0.0, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: PlatformText(
                            style: GoogleFonts.jost(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            trackerStore.uiArray[i].date,
                          ),
                        ),
                      ),
                  ]);
                }));
      },
    );
  }
}
