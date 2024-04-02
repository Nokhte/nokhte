import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorAndStop extends Equatable {
  final Color color;
  final double stop;
  const ColorAndStop(this.color, this.stop);

  @override
  List<Object> get props => [color, stop];
}
