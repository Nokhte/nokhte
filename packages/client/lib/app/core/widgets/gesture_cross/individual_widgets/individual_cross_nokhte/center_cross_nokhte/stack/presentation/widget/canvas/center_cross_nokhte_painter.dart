import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:touchable/touchable.dart';

class CenterCrossNokhtePainter extends CustomPainter {
  final Function onTap;
  final BuildContext context;
  final List<Offset> offsets;
  final List<double> radii;

  CenterCrossNokhtePainter({
    required this.offsets,
    required this.radii,
    required this.onTap,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    for (int i = 0; i < offsets.length; i++) {
      final center = Offset(
        size.width.half() - offsets[i].dx,
        size.height.half() - offsets[i].dy,
      );
      final paint = Paint()..color = Colors.white;
      touchyCanvas.drawCircle(
        center,
        radii[i],
        paint,
        onTapDown: (details) {
          print("is this being tapped??");
          onTap();
        },
      );
    }
  }

  @override
  bool shouldRepaint(CenterCrossNokhtePainter oldDelegate) => true;
}
