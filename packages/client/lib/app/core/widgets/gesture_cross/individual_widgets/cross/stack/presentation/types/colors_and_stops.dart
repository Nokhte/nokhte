import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorsAndStops extends Equatable {
  final List<Color> colors;
  final List<double> stops;

  const ColorsAndStops({
    required this.colors,
    required this.stops,
  });

  @override
  List<Object> get props => [colors, stops];
}
