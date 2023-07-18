// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'water_painter.dart';

class WaterAnimation extends StatefulWidget {
  const WaterAnimation({super.key});

  @override
  _WaterAnimationState createState() => _WaterAnimationState();
}

class _WaterAnimationState extends State<WaterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WaterPainter(_controller),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}
