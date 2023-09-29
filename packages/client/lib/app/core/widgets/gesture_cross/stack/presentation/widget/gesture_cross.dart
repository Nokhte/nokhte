// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:path_morph/path_morph.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_size_calculator.dart';
import 'package:primala/app/core/widgets/gesture_cross/gesture_cross.dart';
import 'canvas/gesture_cross_painter.dart';

class GestureCross extends StatefulWidget {
  final Size size;
  final GestureCrossStore stateTrackerStore;
  const GestureCross({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  State<StatefulWidget> createState() => _GestureCrossState(
        size: size,
        stateTrackerStore: stateTrackerStore,
      );
}

class _GestureCrossState extends State<GestureCross>
    with SingleTickerProviderStateMixin {
  final Size size;
  final GestureCrossStore stateTrackerStore;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    stateTrackerStore.controller = controller;
    PathMorph.generateAnimations(
      controller,
      stateTrackerStore.animationPathData,
      animationRenderingCallback,
    );
  }

  animationRenderingCallback(int i, Offset z) {
    setState(() {
      stateTrackerStore.animationPathData.shiftedPoints[i] = z;
    });
  }

  _GestureCrossState({
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .8,
    );
    return FittedBox(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: GestureCrossPainter(
            PathMorph.generatePath(
              stateTrackerStore.animationPathData,
            ),
          ),
        ),
      ),
    );
  }
}
