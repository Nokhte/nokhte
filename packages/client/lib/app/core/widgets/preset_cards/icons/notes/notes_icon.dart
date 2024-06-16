import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'notes_icon_painter.dart';
export 'notes_icon_movie.dart';

class NotesIcon extends StatelessWidget {
  final double opacity;
  final double containerSize;
  final bool shouldAnimate;
  const NotesIcon({
    super.key,
    required this.opacity,
    required this.containerSize,
    required this.shouldAnimate,
  });

  @override
  Widget build(context) => Opacity(
        opacity: opacity,
        child: CustomAnimationBuilder(
            tween:
                shouldAnimate ? NotesIconMovie.active : NotesIconMovie.static,
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
                    angle: value.get('angle'),
                    containerSize: containerSize,
                  ),
                ),
              );
            }),
      );
}
