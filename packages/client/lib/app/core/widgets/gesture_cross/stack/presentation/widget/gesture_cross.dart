// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_morph/path_morph.dart';
import 'package:primala/app/core/widgets/gesture_cross/gesture_cross.dart';
import 'package:simple_animations/simple_animations.dart';
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
    return Observer(
      builder: (context) => CustomAnimationBuilder(
        tween: stateTrackerStore.movie,
        duration: stateTrackerStore.movie.duration,
        control: stateTrackerStore.colorController,
        onCompleted: () => stateTrackerStore.onAnimationCompleted(),
        builder: (context, value, child) => AnimatedOpacity(
          opacity: stateTrackerStore.showWidget ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: CustomPaint(
              painter: GestureCrossPainter(
                  PathMorph.generatePath(
                    stateTrackerStore.animationPathData,
                  ),
                  size,
                  firstGradientColor: value.get('first gradient color'),
                  secondGradientColor: value.get('second gradient color')),
            ),
          ),
        ),
      ),
    );
  }
}
