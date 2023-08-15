import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class OnShore extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 8),
    ).tween('water movement', Tween<double>(begin: 0, end: 2));

  @override
  List<Object> get props => [];
}
