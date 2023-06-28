import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class P2PSchedulingCanvasEntity extends Equatable {
  final List<Either<IndividualSpiralCircleFill, IndividualSpiralCircleGradient>>
      orderedSpiralColors;
  final String timeOfDay;

  const P2PSchedulingCanvasEntity({
    required this.orderedSpiralColors,
    required this.timeOfDay,
  });

  @override
  List<Object?> get props => [orderedSpiralColors, timeOfDay];
}

class IndividualSpiralCircleFill {
  final Color fillColor;
  IndividualSpiralCircleFill({required this.fillColor});
}

class IndividualSpiralCircleGradient {
  final List<Color> gradientColors;
  final List<double> stops;
  IndividualSpiralCircleGradient({
    required this.gradientColors,
    required this.stops,
  });
}
