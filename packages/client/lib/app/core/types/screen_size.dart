import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScreenSize extends Equatable {
  final double height;
  final double width;
  final EdgeInsets padding;

  const ScreenSize({
    required this.height,
    required this.width,
    required this.padding,
  });

  @override
  List<Object> get props => [height, width, padding];
}
