import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class GradientCrossNokhteUtils {
  static List<List<T>> getValues<T>(
      Movie value, List<Offset> offsets, List<int> valueList, String prefix) {
    final List<List<T>> values = [];
    for (int i = 0; i < offsets.length; i++) {
      final List<T> tempArr = [];
      for (int j = 0; j < valueList[i]; j++) {
        tempArr.add(value.get('circle${i + 1}$prefix${j + 1}'));
      }
      values.add(tempArr);
    }
    return values;
  }

  static List<List<Color>> getGradients(
      Movie value, List<Offset> offsets, List<int> gradientColorLength) {
    return getValues<Color>(value, offsets, gradientColorLength, 'color');
  }

  static List<List<double>> getStops(
      Movie value, List<Offset> offsets, List<int> gradientColorLength) {
    return getValues<double>(value, offsets, gradientColorLength, 'stop');
  }
}
