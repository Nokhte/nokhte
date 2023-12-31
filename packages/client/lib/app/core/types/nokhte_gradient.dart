import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NokhteGradient extends Equatable {
  final List<Color> colors;
  final List<double> stops;

  const NokhteGradient({
    required this.colors,
    required this.stops,
  });

  @override
  List<Object> get props => [
        colors,
        stops,
      ];
}
