// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/types/nokhte_gradient_types.dart';

class NokhteGradientConfig extends Equatable {
  final NokhteGradientTypes gradientType;
  late List<Color> colors;
  late List<double> stops;

  NokhteGradientConfig({
    required this.gradientType,
  }) {
    switch (gradientType) {
      case NokhteGradientTypes.storage:
        colors = const [
          Color(0xFF47D5F9),
          Color(0xFF68E9BA),
        ];
        stops = [.3, 1];
      case NokhteGradientTypes.home:
        colors = const [
          Color(0xFF407F74),
          Color(0xFF53A28F),
          Color(0xFF866243),
          Color(0xFFCBB28E)
        ];
        stops = [0.0, .4, 0.4, 1];
      case NokhteGradientTypes.sessionStarter:
        colors = const [
          Color(0xFFFFE6C4),
          Color(0xFFFFBC78),
          Color(0xFF42FFD9),
          Color(0xFF4497C5),
        ];
        stops = [0, .33, .4, 1.0];
      case NokhteGradientTypes.presets:
        colors = const [
          Color(0xFF40F3F3),
          Color(0xFF40BDF3),
          Color(0xFF40ACF3),
          Color(0xFF409DF3),
          Color(0xFF4072F3),
        ];
        stops = [0, .18, .49, .77, 1.0];
      case NokhteGradientTypes.sessionJoiner:
        colors = const [
          Color(0xFFFFE6C4),
          Color(0xFFFFBC78),
        ];
        stops = const [0, .49];
    }
  }

  @override
  List<Object> get props => [gradientType];
}
