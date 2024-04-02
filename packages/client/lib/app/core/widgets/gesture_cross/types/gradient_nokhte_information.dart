import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GradientNokhteInformation extends Equatable {
  final Offset offsets;
  final List<Color> colors;
  final List<double> stops;
  const GradientNokhteInformation({
    required this.offsets,
    required this.colors,
    required this.stops,
  });

  @override
  List<Object> get props => [offsets, colors, stops];
}
