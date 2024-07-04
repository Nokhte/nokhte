import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class PresetDiagramPainter extends CustomPainter {
  final List<Offset> circleOffsets;
  final List<List<Offset>> lineOffsets;
  final List<double> lineWidth;
  final List<double> radii;
  final List<double> circleStops;
  final List<Color> circleColors;
  final List<LineGradientTypes> lineGradTypes;
  final List<List<Alignment>> lineGradAlignments;
  final List<PaintingStyle> circlePaintingStyles = [
    PaintingStyle.fill,
    PaintingStyle.stroke,
    PaintingStyle.stroke,
    PaintingStyle.stroke,
  ];

  PresetDiagramPainter({
    required this.radii,
    required this.circleOffsets,
    required this.circleColors,
    required this.circleStops,
    required this.lineWidth,
    required this.lineGradTypes,
    required this.lineGradAlignments,
    required this.lineOffsets,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < circleOffsets.length; i++) {
      final center = Offset(
        (size.width * circleOffsets[i].dx),
        (size.height * circleOffsets[i].dy),
      );

      final circleRect = Rect.fromCircle(center: center, radius: radii[i]);
      canvas.drawCircle(
        center,
        radii[i],
        Paint()
          ..shader = LinearGradient(
            colors: circleColors,
            stops: circleStops,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ).createShader(circleRect)
          ..style = circlePaintingStyles[i]
          ..strokeWidth = 4,
      );
    }
    for (int i = 0; i < lineOffsets.length; i++) {
      Offset start = Offset.zero;
      Offset end = Offset.zero;
      start = Offset(
        (size.width * lineOffsets[i][0].dx),
        (size.height * lineOffsets[i][0].dy),
      );
      end = Offset(
        (size.width * lineOffsets[i][1].dx),
        (size.height * lineOffsets[i][1].dy),
      );

      final paint = Paint()
        ..color = Colors.white
        ..style = circlePaintingStyles[i]
        ..strokeWidth = size.width * lineWidth[i];

      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..lineTo(start.dx, start.dy)
        ..lineTo(
          end.dx,
          end.dy,
        );
      final rect = path.getBounds();

      paint.shader = LinearGradient(
        colors: getGrad(lineGradTypes[i])[0],
        stops: getGrad(lineGradTypes[i])[1],
        begin: lineGradAlignments[i][0],
        end: lineGradAlignments[i][1],
      ).createShader(rect);

      canvas.drawLine(
        start,
        end,
        paint,
      );
    }
  }

  getGrad(LineGradientTypes gradType) {
    switch (gradType) {
      case LineGradientTypes.talking:
        return [
          const [
            Color(0xFF43D3F5),
            Color(0xFF49D6EF),
            Color(0xFF4FD9E8),
            Color(0xFF53DCE3),
            Color(0xFFF9EFB7),
            Color(0xFFFAF2C3),
            Color(0xFFFFFFDC),
            Color(0xFFF5DC91),
          ],
          [
            0.0,
            .19,
            .32,
            .35,
            .55,
            .85,
            .9,
            1.00,
          ]
        ];
      case LineGradientTypes.notes:
        return [
          const [
            Color(0xFF44D3FE),
            Color(0xFF44D3FE),
            Color(0xFF6BE9BB),
          ],
          [
            0.0,
            .3,
            1.0,
          ]
        ];
    }
  }

  @override
  shouldRepaint(oldDelegate) => true;
}
