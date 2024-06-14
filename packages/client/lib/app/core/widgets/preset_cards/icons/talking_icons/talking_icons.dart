import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'talking_icons_painter.dart';
export 'talking_icons_movie.dart';

class TalkingIcons extends StatelessWidget {
  final bool isHoldToTalk;
  const TalkingIcons({
    super.key,
    required this.isHoldToTalk,
  });

  @override
  Widget build(BuildContext context) => LoopAnimationBuilder(
        tween: TalkingIconsMovie.movie,
        duration: TalkingIconsMovie.movie.duration,
        builder: (context, value, child) => FullScreen(
          child: CustomPaint(
            painter: TalkingIconsPainter(
              showTheH: isHoldToTalk,
              color: value.get('color'),
            ),
          ),
        ),
      );
}
