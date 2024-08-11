import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Jost extends StatelessWidget {
  final double fontSize;
  final Color fontColor;
  final String content;
  final bool shouldCenter;
  const Jost(
    this.content, {
    super.key,
    this.fontSize = 30.0,
    this.fontColor = Colors.white,
    this.shouldCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: shouldCenter ? TextAlign.center : null,
      style: GoogleFonts.jost(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
