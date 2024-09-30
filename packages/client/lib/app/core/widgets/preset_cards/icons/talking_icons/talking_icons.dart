import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'talking_icons_painter.dart';
export 'talking_icons_movie.dart';

class TalkingIcons extends BaseIcon {
  final bool isHoldToTalk;
  const TalkingIcons({
    super.key,
    required this.isHoldToTalk,
    required super.containerSize,
    required super.shouldAnimate,
    super.opacity = 1.0,
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
                showText: shouldAnimate,
                opacity: opacity,
                sizeScalar: containerSize,
                showTheH: isHoldToTalk,
                color: value.get('color'),
              ),
            ),
          ),
        ),
      );
}
