// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/gesture_cross/gesture_cross/stack/types/nokhte_gradient_types.dart';

class NokhteGradientConfig extends Equatable {
  final NokhteGradientTypes gradientType;
  int gradientLength = 0;

  NokhteGradientConfig({
    required this.gradientType,
  }) {
    switch (gradientType) {
      case NokhteGradientTypes.vibrantBlue:
        gradientLength = 2;
      case NokhteGradientTypes.water:
        gradientLength = 4;
    }
  }

  @override
  List<Object> get props => [gradientType];
}
