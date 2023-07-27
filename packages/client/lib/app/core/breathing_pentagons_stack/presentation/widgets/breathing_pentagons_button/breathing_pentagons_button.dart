/// breathing_pentagons_button.dart
// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'canvas/breathing_pentagons_painter.dart';

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
    with SingleTickerProviderStateMixin {
  final Size size;
  late AnimationController _controller;
  _BreathingPentagonsAnimationState({required this.size});
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.6,
      upperBound: .95,
      duration: const Duration(
        seconds: 7,
        // milliseconds: 1,
      ),
    )..repeat(
        reverse: true,
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: BreathingPentagonsPainter(
        animation: _controller,
      ),
    );
  }
}
