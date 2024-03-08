import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class TouchRippleAnimationInfo extends Equatable {
  final Offset position;
  final MovieTween movie;
  final Control control;
  final Color rippleColor;
  const TouchRippleAnimationInfo({
    required this.position,
    required this.movie,
    required this.control,
    required this.rippleColor,
  });

  @override
  List<Object?> get props => [position, movie, control, rippleColor];
}
