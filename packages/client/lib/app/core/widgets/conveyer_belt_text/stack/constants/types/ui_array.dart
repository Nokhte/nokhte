import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UIArray extends Equatable {
  final List<Color> gradient;
  final String date;
  const UIArray({
    required this.gradient,
    required this.date,
  });
  @override
  List<Object> get props => [];
}
