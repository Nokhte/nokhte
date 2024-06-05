import 'package:flutter/material.dart';

class SessionPhonePlacementGuidePainter extends CustomPainter {
  final List<double> upwardOpacities;
  final List<double> downwardOpacities;

  SessionPhonePlacementGuidePainter({
    required this.upwardOpacities,
    required this.downwardOpacities,
  });

  @override
  void paint(Canvas canvas, Size size) {
    paintArrows(
      canvas,
      size,
      opacities: upwardOpacities,
      startingScalar: -260,
      endingScalar: -190,
    );
    paintArrows(
      canvas,
      size,
      startingScalar: 40,
      opacities: downwardOpacities,
      endingScalar: -30,
    );
  }

  paintArrows(
    Canvas canvas,
    Size size, {
    required List<double> opacities,
    required int startingScalar,
    required int endingScalar,
  }) {
    final center = Offset(
      (size.height / 2),
      (size.width / 2) + startingScalar,
    );
    final endPoint =
        Offset(center.dx + 130, (center.dy - startingScalar) + endingScalar);
    for (int i = 0; i < 4; i++) {
      final otherPaint = Paint()
        ..color = Colors.white.withOpacity(opacities[i])
        ..strokeWidth = 1.5;
      final start = Offset(center.dx, center.dy + calcDistance(i));
      final end = Offset(endPoint.dx, endPoint.dy + calcDistance(i));
      canvas.drawLine(start, end, otherPaint);
      final iStart = Offset((center.dx) * -1, center.dy + calcDistance(i));
      final iEnd = Offset(endPoint.dx * -1, endPoint.dy + calcDistance(i));
      canvas.drawLine(iStart, iEnd, otherPaint);
    }
  }

  int calcDistance(int i) => (25 * (i + 1));

  @override
  bool shouldRepaint(oldDelegate) => true;
}
