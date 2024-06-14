import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'notes_icon_painter.dart';

class NotesIcon extends StatelessWidget {
  const NotesIcon({
    super.key,
  });

  @override
  Widget build(context) => FullScreen(
        child: CustomPaint(
          painter: NotesIconPainter(),
        ),
      );
}
