/// breathing_pentagons_button.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'breathing_pentagons_painter.dart';

class BreathingPentagonsButton extends StatefulWidget {
  const BreathingPentagonsButton({super.key});

  @override
  _BreathingPentagonsAnimationState createState() =>
      _BreathingPentagonsAnimationState();
}

class _BreathingPentagonsAnimationState extends State<BreathingPentagonsButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    // double width = MediaQuery.of(context).size.width;
    // var padding = MediaQuery.of(context).padding;
    // double unrefinedHeight = MediaQuery.of(context).size.height;
    // double height = unrefinedHeight - padding.top - padding.bottom;
    // double desiredSize = width < height ? width * .95 : height * .95;
    // Size size = Size(desiredSize, desiredSize);
    return CustomPaint(
      painter: BreathingPentagonsPainter(
        animation: _controller,
      ),
    );
  }
}
