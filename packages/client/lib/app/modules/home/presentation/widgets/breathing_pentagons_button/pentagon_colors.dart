/// pentagon_colors.dart
import 'package:flutter/material.dart';

class PentagonColors {
  static List<Color> get firstPentagonLinGradBackground => const [
        Color(0xFF152934),
        Color(0xFF214047),
      ];
  static List<Color> get firstPentagonRadGradient => [
        const Color(0xFFD9D9D9),
        const Color(0x000083FC),
      ];
  static List<Color> get secondPentagonRadGradient =>
      [const Color(0xFFD9D9D9), const Color(0x001400FF)];
  static List<Color> get thirdPentagonRadGradient =>
      [const Color(0xFFD9D9D9), const Color(0x004BC9FF)];
}
