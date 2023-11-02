import 'package:flutter/material.dart';

class PerspectivesMapAnimationData {
  static double get baseVertOffset => 0.0;
  static double get elevatedVertOffset => -3.0;
  static Color get doneColor => const Color(0xFF79FE6D);
  static Color get commitInProgressColor => const Color(0xFFFFB783);
  static Color get regularBaseColor => Colors.white;
  static List<Color> getWhiteArr(int activeIndex) {
    final list = List.filled(5, Colors.white.withOpacity(.5));
    list[activeIndex] = Colors.white;
    return list;
  }

  static List<Color> getCommitInProgressArr(int activeIndex) {
    final list = List.filled(5, Colors.white.withOpacity(.5));
    list[activeIndex] = commitInProgressColor;
    return list;
  }

  static List<Color> getCommittedArr(int activeIndex) {
    final list = List.filled(5, Colors.white.withOpacity(.5));
    list[activeIndex] = doneColor;
    return list;
  }

  static List<double> getVertOffArr(int activeIndex) {
    final list = List.filled(5, 0.0);
    list[activeIndex] = elevatedVertOffset;
    print(list);
    return list;
  }
}
