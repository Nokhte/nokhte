import 'package:flutter/material.dart';
import 'notes_icon_painter.dart';

class NotesIcon extends StatelessWidget {
  final double opacity;
  final double containerSize;
  const NotesIcon({
    super.key,
    required this.opacity,
    required this.containerSize,
  });

  @override
  Widget build(context) => Opacity(
        opacity: opacity,
        child: SizedBox(
          height: containerSize * .23,
          width: containerSize * .23,
          child: CustomPaint(
            painter: NotesIconPainter(
              containerSize: containerSize,
            ),
          ),
        ),
      );
}
