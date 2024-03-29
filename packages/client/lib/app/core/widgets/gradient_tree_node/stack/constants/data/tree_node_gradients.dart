import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/nokhte_gradient.dart';

class TreeNodeGradients {
  static List<Color> get yellowColors => const [
        Color(0xFFFFF37A),
        Color(0xFFFFE48F),
        Color(0xFFFFBF31),
      ];
  static List<Color> get blueColors => const [
        Color(0xFF44D3FE),
        Color(0xFF44D3FE),
        Color(0xFF6BE9BB),
      ];
  static List<double> get yellowStops => [0, .5, 1];
  static List<double> get blueStops => [0, .5, 1];
  static NokhteGradient get yellow => NokhteGradient(
        colors: yellowColors,
        stops: yellowStops,
      );
  static NokhteGradient get blue => NokhteGradient(
        colors: yellowColors,
        stops: yellowStops,
      );
}
