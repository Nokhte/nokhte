import 'package:dartz/dartz.dart';
import 'colors_and_stops.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CircleInformation extends Equatable {
  final Either<Color, ColorsAndStops> colorOrGradient;
  final Offset offset;
  final Alignment startingAlignment;
  final Alignment endingAlignment;

  const CircleInformation({
    required this.colorOrGradient,
    required this.offset,
    this.startingAlignment = Alignment.topCenter,
    this.endingAlignment = Alignment.topCenter,
  });
  @override
  List<Object> get props => [colorOrGradient, offset];
}
