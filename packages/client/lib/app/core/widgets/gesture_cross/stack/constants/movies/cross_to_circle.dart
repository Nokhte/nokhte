import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CrossToCircle extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(
        seconds: 0,
      ),
      end: const Duration(
        seconds: 3,
      ),
    ).tween(
      'value',
      Tween<double>(
        begin: 0,
        end: 10,
      ),
    );

  @override
  List<Object> get props => [movie];
}
