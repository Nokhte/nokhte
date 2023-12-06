import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';

Size useCustomSquareSize(double decimalValue) {
  final context = useContext();
  Size size = Size.zero;
  size = CanvasSizeCalculator.squareCanvas(
    context: context,
    percentageLength: decimalValue,
  );
  return size;
}
