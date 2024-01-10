// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SmartVerticalText extends HookWidget {
  final SmartVerticalTextStore store;
  String text;
  final double textSizeScalar;
  List<MainAxisAlignment> columnAlignments;
  List<EdgeInsets> columnPaddings;

  int numberOfRows = 0;
  List<int> numberOfColumnsPerRow = [];
  List<String> splitText = [];

  SmartVerticalText(
    this.text, {
    super.key,
    this.textSizeScalar = 0.05,
    this.columnAlignments = const [],
    this.columnPaddings = const [],
    required this.store,
  }) {
    text = text.toUpperCase();
    splitText = text.split(' ');
    numberOfRows = splitText.length;
    if (columnAlignments.isEmpty) {
      columnAlignments = List.filled(numberOfRows, MainAxisAlignment.start);
    }
    if (columnPaddings.isEmpty) {
      columnPaddings = List.filled(numberOfRows, EdgeInsets.zero);
    }

    for (final word in splitText) {
      numberOfColumnsPerRow.add(word.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FullScreen(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          splitText.length,
          (i) => Padding(
            padding: columnPaddings[i],
            child: Column(
              mainAxisAlignment: columnAlignments[i],
              children: List.generate(
                splitText[i].length,
                (j) => Text(
                  splitText[i][j],
                  style: GoogleFonts.jost(
                    color: Colors.white,
                    fontSize: useFullScreenSize().height * .05,
                    // letterSpacing: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
