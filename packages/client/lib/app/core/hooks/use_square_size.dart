import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Size useSquareSize({
  required double relativeLength,
}) {
  final context = useContext();
  double width = MediaQuery.of(context).size.width;
  var padding = MediaQuery.of(context).padding;
  double unrefinedHeight = MediaQuery.of(context).size.height;
  double height = unrefinedHeight - padding.top - padding.bottom;
  double desiredSize =
      width < height ? width * relativeLength : height * relativeLength;
  return Size(desiredSize, desiredSize);
}
