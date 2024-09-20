import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chivo extends StatelessWidget {
  final double fontSize;
  final Color fontColor;
  final String content;
  final bool shouldCenter;
  final bool shouldItalicize;
  final FontWeight fontWeight;
  const Chivo(
    this.content, {
    super.key,
    this.fontWeight = FontWeight.w200,
    this.fontSize = 30.0,
    this.fontColor = Colors.white,
    this.shouldItalicize = false,
    this.shouldCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: shouldCenter ? TextAlign.center : null,
      // softWrap: true,
      style: GoogleFonts.chivo(
        fontSize: fontSize,
        color: fontColor,
        textStyle: TextStyle(
          fontWeight: fontWeight,
          fontStyle: shouldItalicize ? FontStyle.italic : FontStyle.normal,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
