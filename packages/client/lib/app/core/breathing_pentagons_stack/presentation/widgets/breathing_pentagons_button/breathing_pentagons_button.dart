/// breathing_pentagons_button.dart
// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'canvas/breathing_pentagons_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class BreathingPentagonsButton extends StatefulWidget {
  final Size size;
  const BreathingPentagonsButton({
    super.key,
    required this.size,
  });

  @override
  _BreathingPentagonsAnimationState createState() =>
      _BreathingPentagonsAnimationState(size: size);
}

class _BreathingPentagonsAnimationState extends State<BreathingPentagonsButton>
    with AnimationMixin {
  final Size size;
  late Animation<double> angle;
  late Animation<double> scale;
  // late AnimationController _controller;
  _BreathingPentagonsAnimationState({required this.size});
  @override
  void initState() {
    super.initState();
    controller.duration = const Duration(seconds: 7);
    angle = Tween<double>(
      begin: 0.0,
      end: 0.35,
    ).animate(controller);
    scale = Tween<double>(
      begin: 0.6,
      end: .95,
    ).animate(controller);
    controller.mirror();
  }

  @override
  Widget build(BuildContext context) {
    // print(angle);
    return CustomPaint(
      size: size,
      painter: BreathingPentagonsPainter(
        angleParam: angle,
        scaleParam: scale,
      ),
    );
  }
}
