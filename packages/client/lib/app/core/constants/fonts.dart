import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle kantumruy({
    required double fontSize,
    Color color = Colors.white,
  }) =>
      GoogleFonts.kantumruyPro(
        fontSize: fontSize,
        color: color,
      );

  static TextStyle jost({
    required double fontSize,
    Color color = Colors.white,
  }) =>
      GoogleFonts.jost(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );
}
