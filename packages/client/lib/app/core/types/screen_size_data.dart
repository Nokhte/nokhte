import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScreenSizeData extends Equatable {
  final double height;
  final double width;
  final EdgeInsets padding;

  const ScreenSizeData({
    required this.height,
    required this.width,
    required this.padding,
  });

  static zero() =>
      const ScreenSizeData(height: 0.0, width: 0.0, padding: EdgeInsets.zero);

  @override
  List<Object> get props => [height, width, padding];
}
