import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HourMarkPainterInformation extends Equatable {
  final Offset startingCoordinates;
  final Offset endingCoordinates;
  const HourMarkPainterInformation({
    required this.startingCoordinates,
    required this.endingCoordinates,
  });

  @override
  List<Object> get props => [startingCoordinates, endingCoordinates];
}
