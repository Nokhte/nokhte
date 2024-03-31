import 'package:flutter/material.dart';

class CircleOffsets {
  static Offset get center => const Offset(35, 35);

  static Offset get right => const Offset(60, 35);
  static Offset get left => const Offset(10, 35);

  static Offset get top => const Offset(35, 9);
  static Offset get bottom => const Offset(35, 60);

  static List<Offset> get directions => [top, bottom, left, right];
}
