/// water_animation.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [WaterAnimation] widget, which displays an animated
/// water effect using the [WaterPainter] custom painter. The animation is
/// driven by an [AnimationController] to control the water waves' movement and
/// appearance.
///
/// [WaterAnimation] extends [StatefulWidget] and creates an
/// [AnimationController] in its [initState] method, allowing the animation
/// to repeat in a continuous loop.
///
/// The [WaterAnimation] widget updates its appearance using the
/// [AnimatedBuilder] widget. It rebuilds whenever the [AnimationController]
/// triggers changes.
///
/// The animation duration can be adjusted to control the speed of the water
/// animation.
///
/// Note: The ignore_for_file directive is used to suppress warnings about
/// private types being used in the public API of the module.

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
