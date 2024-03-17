import 'package:flutter/material.dart';

class CircleOffsets {
  static Offset get center => const Offset(-1, 4);

  static Offset get right => const Offset(-25, 4);
  static Offset get left => const Offset(23, 4);

  static Offset get top => const Offset(-1, 28);
  static Offset get bottom => const Offset(-1, -20);

  static List<Offset> get directions => [top, bottom, left, right];
}
