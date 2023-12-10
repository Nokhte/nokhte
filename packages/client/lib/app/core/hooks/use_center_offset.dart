import 'package:flutter/material.dart';
import 'package:nokhte/app/core/hooks/use_screen_size_data.dart';

Offset useCenterOffset() {
  final screenSize = useScreenSizeData(),
      centerX = screenSize.width / 2,
      centerY = screenSize.height / 2;
  return Offset(centerX, centerY);
}
