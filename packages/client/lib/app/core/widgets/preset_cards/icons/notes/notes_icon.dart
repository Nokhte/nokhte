import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'notes_icon_painter.dart';
export 'notes_icon_movie.dart';

class NotesIcon extends BaseIcon {
  const NotesIcon({
    super.key,
    required super.containerSize,
    super.opacity = 1.0,
    required super.shouldAnimate,
  });

  @override
  Widget build(context) => CustomAnimationBuilder(
      tween: shouldAnimate ? NotesIconMovie.active : NotesIconMovie.static,
      duration: shouldAnimate
          ? NotesIconMovie.active.duration
          : NotesIconMovie.static.duration,
      control: shouldAnimate ? Control.loop : Control.stop,
      builder: (context, value, child) {
        return SizedBox(
          height: containerSize * .23,
          width: containerSize * .23,
          child: CustomPaint(
            painter: NotesIconPainter(
              showText: shouldAnimate,
              masterOpacity: opacity,
              angle: value.get('angle'),
              containerSize: containerSize,
            ),
          ),
        );
      });
}
