import 'package:flutter/material.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/hooks/use_screen_size_data.dart';

Offset useCenterOffset() {
  final screenSize = useScreenSizeData(),
      centerX = screenSize.width.half(),
      centerY = screenSize.height.half();
  return Offset(centerX, centerY);
}
