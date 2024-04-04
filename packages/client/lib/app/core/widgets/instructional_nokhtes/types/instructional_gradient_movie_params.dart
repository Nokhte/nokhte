import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class InstructionalGradientMovieParams extends Equatable {
  final Offset center;
  final GradientNokhtePositions position;
  final GradientNokhteColorways colorway;
  final InstructionalGradientDirections direction;

  const InstructionalGradientMovieParams({
    required this.center,
    required this.colorway,
    required this.direction,
    required this.position,
  });

  @override
  List<Object> get props => [center, position, colorway, direction];
}
