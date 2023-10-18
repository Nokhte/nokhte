import 'package:flutter/material.dart';

class ConveyerColors {
  static Color get grey => const Color(0x50FFFFFF);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get transparent => const Color(0x00FFFFFF);

  static List<Color> get invisible => [transparent, transparent];
  static List<Color> get outOfRange => [grey, grey];
  static List<Color> get inRange => [white, white];
}
