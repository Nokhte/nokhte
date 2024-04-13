import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class InstructionalNokhteUtils {
  static StartAndEndOffsets getOffsets(
    Offset screenCenter, {
    required InstructionalNokhtePositions position,
    required InstructionalGradientDirections direction,
  }) {
    Offset start = Offset.zero;
    Offset end = Offset.zero;
    switch (position) {
      case InstructionalNokhtePositions.left:
        switch (direction) {
          case InstructionalGradientDirections.enlarge:
            start = Offset(CircleOffsets.left.dx, CircleOffsets.left.dy);
            end = Offset((-screenCenter.dy) * .25, (-screenCenter.dy) * .8);
          case InstructionalGradientDirections.shrink:
            start = Offset((-screenCenter.dy) * .25, (-screenCenter.dy) * .8);
            end = Offset(CircleOffsets.left.dx, CircleOffsets.left.dy);
        }
      case InstructionalNokhtePositions.right:
        switch (direction) {
          case InstructionalGradientDirections.enlarge:
            start = Offset(CircleOffsets.right.dx, CircleOffsets.right.dy);
            end = Offset((screenCenter.dx) * .9, (-screenCenter.dy) * .8);
          case InstructionalGradientDirections.shrink:
            start = Offset((screenCenter.dx) * .9, (-screenCenter.dy) * .8);
            end = Offset(CircleOffsets.right.dx, CircleOffsets.right.dy);
        }
      case InstructionalNokhtePositions.top:
        switch (direction) {
          case InstructionalGradientDirections.enlarge:
            start = Offset(CircleOffsets.center.dx, CircleOffsets.top.dy);
            end = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * 1.2);
          case InstructionalGradientDirections.shrink:
            start = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * 1.2);
            end = Offset(CircleOffsets.center.dx, CircleOffsets.top.dy);
        }
      case InstructionalNokhtePositions.bottom:
        switch (direction) {
          case InstructionalGradientDirections.enlarge:
            start = Offset(CircleOffsets.center.dx, CircleOffsets.bottom.dy);
            end = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * .4);
          case InstructionalGradientDirections.shrink:
            start = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * .4);
            end = Offset(CircleOffsets.center.dx, CircleOffsets.bottom.dy);
        }
      default:
        break;
    }
    return StartAndEndOffsets(
      start: start,
      end: end,
    );
  }

  static List<ColorAndStop> getGradient(GradientNokhteColorways colorway) {
    List<ColorAndStop> temp = [];
    switch (colorway) {
      case GradientNokhteColorways.invertedBeachWave:
        temp = const [
          ColorAndStop(Color(0xFFFFE6C4), 0.0),
          ColorAndStop(Color(0xFFFFBC78), .33),
          ColorAndStop(Color(0xFF42FFD9), .4),
          ColorAndStop(Color(0xFF4497C5), 1.0),
        ];
      case GradientNokhteColorways.beachWave:
        temp = const [
          ColorAndStop(Color(0xFF407F74), 0),
          ColorAndStop(Color(0xFF53A28F), .4),
          ColorAndStop(Color(0xFF866243), .4),
          ColorAndStop(Color(0xFFCBB28E), 1),
        ];
      case GradientNokhteColorways.vibrantBlue:
        temp = const [
          ColorAndStop(Color(0xFF44D3FE), 0),
          ColorAndStop(Color(0xFF44D3FE), 0),
          ColorAndStop(Color(0xFF6BE9BB), 1),
          ColorAndStop(Color(0xFF6BE9BB), 1),
        ];
    }
    return temp;
  }
}
