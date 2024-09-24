import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

mixin DemoPainterUtils {
  final phoneAspectRatio = .5;
  final phoneCornerRadius = 15.0;
  Offset getCenterPhoneOffset(Size size, double containerSize) {
    final double phoneHeight = containerSize * 0.8;
    final double phoneWidth = phoneHeight * phoneAspectRatio;

    return Offset(
      (size.width - phoneWidth) / 2,
      (size.height - phoneHeight) / 2,
    );
  }

  double getPhoneHeight(double containerSize) => containerSize * 0.8;

  double getPhoneWidth(double containerSize) =>
      getPhoneHeight(containerSize) * phoneAspectRatio;

  Offset getLeftPhoneOffset(Size size, double containerSize) {
    final double phoneHeight = containerSize * 0.8;
    final double phoneWidth = phoneHeight * phoneAspectRatio;

    final double spacing = containerSize * 0.08;
    final double totalWidth = 2 * phoneWidth + spacing;

    return Offset(
      (size.width - totalWidth) / 2,
      (size.height - phoneHeight) / 2,
    );
  }

  Offset getRightPhoneOffset(Size size, double containerSize) {
    final double phoneHeight = containerSize * 0.8;
    final double spacing = containerSize * 0.08;
    final double phoneWidth = phoneHeight * phoneAspectRatio;
    final leftPhoneOffset = getLeftPhoneOffset(size, containerSize);
    return leftPhoneOffset.translate(phoneWidth + spacing, 0);
  }

  void paintText(
    Canvas canvas,
    Offset center,
    String text,
    double containerSize,
    double opacity,
    DemoTextPosition textPosition,
    Rect rect,
  ) {
    double fontSize = containerSize * .035;
    Color color = Colors.white;
    switch (textPosition) {
      case DemoTextPosition.slightlyAboveCenter:
        fontSize = containerSize * .035;
      case DemoTextPosition.slightlyBelowCenter:
        fontSize = containerSize * .035;
        color = SessionConstants.blue;
      case DemoTextPosition.belowCenter:
        fontSize = containerSize * .03;
      case DemoTextPosition.leftHeader:
        fontSize = containerSize * .05;
      default:
        break;
    }
    Offset offset = Offset.zero;
    final textSpan = TextSpan(
      text: text,
      style: textPosition == DemoTextPosition.leftHeader ||
              textPosition == DemoTextPosition.rightHeader
          ? GoogleFonts.chivo(
              fontSize: fontSize,
              fontWeight: FontWeight.w300,
              color: color.withOpacity(opacity),
            )
          : GoogleFonts.jost(
              fontSize: fontSize,
              color: color.withOpacity(opacity),
            ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: rect.width,
    );
    switch (textPosition) {
      case DemoTextPosition.slightlyAboveCenter:
        offset = Offset(
          (center.dx - textPainter.width / 2),
          (center.dy - textPainter.height / 2) - (containerSize * .095),
        );
      case DemoTextPosition.slightlyBelowCenter:
        offset = Offset(
          (center.dx - textPainter.width / 2),
          (center.dy - textPainter.height / 2) + (containerSize * .095),
        );
      case DemoTextPosition.aboveCenter:
        offset = Offset(
          (center.dx - textPainter.width / 2),
          (center.dy - textPainter.height / 2) - (containerSize * .14),
        );
      case DemoTextPosition.belowCenter:
        offset = Offset(
          (center.dx - textPainter.width / 2),
          (center.dy - textPainter.height / 2) + (containerSize * .32),
        );
      case DemoTextPosition.leftHeader:
        offset = Offset(
          (center.dx - textPainter.width / 2),
          (center.dy - textPainter.height / 2) - (containerSize * .45),
        );
      case DemoTextPosition.rightHeader:
        offset = Offset(
          (center.dx - textPainter.width / 2),
          (center.dy - textPainter.height / 2) - (containerSize * .45),
        );
      default:
        break;
    }
    textPainter.paint(canvas, offset);
  }

  void drawBlurredBorder(
    Canvas canvas,
    Offset offset,
    double width,
    double height,
    double cornerRadius,
    Color color,
    double strokeWidth,
  ) {
    final borderRect = RRect.fromRectAndRadius(
      offset & Size(width, height), // Inward expansion
      Radius.circular(cornerRadius),
    );

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;

    // Clip the border using ClipRRect to ensure it respects the corner radius
    // canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(
      offset & Size(width, height), // Use the same rect as the phone
      Radius.circular(cornerRadius),
    ));

    canvas.saveLayer(
      borderRect.outerRect,
      Paint()..imageFilter = ImageFilter.blur(sigmaX: 20, sigmaY: 20),
    );
    // Draw the border with blur
    canvas.saveLayer(
        borderRect.outerRect, Paint()); // Create a layer for blur effect
    canvas.drawRRect(borderRect, borderPaint);

    canvas.restore(); // Restore after blur
    canvas.restore(); // Restore after clipping
  }

  void drawPhone(Canvas canvas, Offset offset, double width, double height,
      LinearGradient grad, double cornerRadius) {
    final paint = Paint()
      ..shader = grad.createShader(offset & Size(width, height));
    final phoneRect = RRect.fromRectAndRadius(
      offset & Size(width, height),
      Radius.circular(cornerRadius),
    );
    canvas.drawRRect(phoneRect, paint);
  }

  void paintNotesText(
    Canvas canvas,
    Offset center,
    String text,
    double containerSize,
    double opacity,
    double progress,
    Rect rect,
  ) {
    double fontSize = containerSize * .035;
    Offset offset = Offset.zero;

    final textSpan = TextSpan(
      text: text,
      style: GoogleFonts.jost(
        fontSize: fontSize,
        color: Colors.white.withOpacity(opacity),
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: rect.width,
    );

    offset = Offset(
      (center.dx - textPainter.width / 2) - (containerSize * .07),
      (center.dy - textPainter.height / 2) - (containerSize * .14),
    );

    double clipWidth =
        textPainter.width * progress; // Shrinks from left to right
    Rect clipRect =
        Rect.fromLTWH(offset.dx, offset.dy, clipWidth, textPainter.height);

    canvas.save();

    canvas.clipRect(clipRect);

    textPainter.paint(canvas, offset);

    canvas.restore();
  }
}
