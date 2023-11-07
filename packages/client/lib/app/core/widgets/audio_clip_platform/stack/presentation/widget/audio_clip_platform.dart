import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/audio_clip_platform/stack/presentation/presentation.dart';
import 'package:nokhte/app/core/widgets/audio_clip_platform/stack/presentation/widget/canvas/audio_clip_platform_painter.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:simple_animations/simple_animations.dart';

class AudioClipPlatform extends StatelessWidget {
  final AudioClipPlatformTrackerStore stateTrackerStore;
  final Size size;
  const AudioClipPlatform({
    super.key,
    required this.stateTrackerStore,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
          opacity: stateTrackerStore.showWidget ? 1 : 0,
          duration: Seconds.get(1),
          child: CustomAnimationBuilder(
            tween: stateTrackerStore.movie,
            duration: stateTrackerStore.movie.duration,
            control: stateTrackerStore.control,
            builder: ((context, value, child) => Container(
                  alignment: Alignment.topLeft,
                  width: size.width,
                  height: size.height,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.5, top: 60.0),
                      // padding: const EdgeInsets.only(),
                      child: CustomPaint(
                        size: size,
                        painter: AudioClipPlatformPainter(
                          platformGradColors: [
                            const Color(0xFF0A98FF),
                            const Color(0x00FFFFFF),
                          ],
                          path: SvgAnimtionConstants.threeCirclePlatformPath,
                          pathBounds: SvgAnimtionConstants
                              .threeCirclePlatformPath
                              .getBounds(),
                        ),
                      ),
                    ),
                  ),
                )),
          )),
    );
  }
}
