import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'talking_icons_painter.dart';
export 'talking_icons_movie.dart';

class TalkingIcons extends StatelessWidget {
  final double opacity;
  final double containerSize;
  final bool isHoldToTalk;
  final bool shouldAnimate;
  const TalkingIcons({
    super.key,
    required this.isHoldToTalk,
    required this.opacity,
    required this.containerSize,
    required this.shouldAnimate,
  });

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: opacity,
        child: CustomAnimationBuilder(
          tween: shouldAnimate
              ? TalkingIconsMovie.active
              : TalkingIconsMovie.static,
          duration: shouldAnimate
              ? TalkingIconsMovie.active.duration
              : TalkingIconsMovie.static.duration,
          control: shouldAnimate ? Control.loop : Control.stop,
          builder: (context, value, child) => SizedBox(
            height: containerSize * .23,
            width: containerSize * .23,
            child: CustomPaint(
              painter: TalkingIconsPainter(
                sizeScalar: containerSize,
                showTheH: isHoldToTalk,
                color: value.get('color'),
              ),
            ),
          ),
        ),
      );
}
