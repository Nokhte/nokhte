import 'package:flutter/material.dart';

class TextEditorConstants {
  static TextStyle get mainTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 40.0,
      );
  static int get maxLines => 4;
  static int get maxLength => 38;
  static TextStyle get hintTextStyle => TextStyle(
          color: Colors.white.withOpacity(
        .30,
      ));
  static Color get soloCursorColor => const Color(0xFFE88787);
  static Color get collaboratorCursorColor => const Color(0xFFEBEE6D);
}
