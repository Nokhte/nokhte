// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/gesture_cross/stack/types/nokhte_gradient_types.dart';

class NokhteGradientConfig extends Equatable {
  final NokhteGradientTypes gradientType;
  late List<Color> colors;
  late List<double> stops;

  NokhteGradientConfig({
    required this.gradientType,
  }) {
    switch (gradientType) {
      case NokhteGradientTypes.vibrantBlue:
        colors = const [
          Color(0xFF47D5F9),
          Color(0xFF68E9BA),
        ];
        stops = [.3, 1];
      case NokhteGradientTypes.onShore:
        colors = const [
          Color(0xFF407F74),
          Color(0xFF53A28F),
          Color(0xFF866243),
          Color(0xFFCBB28E)
        ];
        stops = [0.0, .4, 0.4, 1];
      case NokhteGradientTypes.oceanDive:
        colors = const [Color(0xFF417EA5), Color(0xFF6DE5C8)];
        stops = [.3, 1];
    }
  }

  @override
  List<Object> get props => [gradientType];
}
