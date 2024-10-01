import 'package:flutter/material.dart';

abstract class BaseIcon extends StatelessWidget {
  final bool shouldAnimate;
  final double opacity;
  final double containerSize;
  const BaseIcon({
    super.key,
    this.opacity = 1.0,
    required this.shouldAnimate,
    required this.containerSize,
  });
}
