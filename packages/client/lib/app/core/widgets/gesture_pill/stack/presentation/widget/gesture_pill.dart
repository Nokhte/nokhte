// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_morph/path_morph.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/gesture_pill/gesture_pill.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/gesture_cross_painter.dart';

class GesturePill extends StatefulWidget {
  final Size size;
  final GesturePillStore stateTrackerStore;
  const GesturePill({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  State<StatefulWidget> createState() => _GestureCrossState();
}

class _GestureCrossState extends State<GesturePill>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Path currentPath;

  @override
  initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Seconds.get(1));
    widget.stateTrackerStore.controller = controller;
    PathMorph.generateAnimations(
      controller,
      widget.stateTrackerStore.animationPathData,
      animationRenderingCallback,
    );
    currentPath = PathMorph.generatePath(
      widget.stateTrackerStore.animationPathData,
    );
  }

  animationRenderingCallback(int i, Offset z) {
    setState(() {
      widget.stateTrackerStore.animationPathData.shiftedPoints[i] = z;
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateTracker = widget.stateTrackerStore;
    return Observer(
      builder: (context) => CustomAnimationBuilder(
        tween: stateTracker.movie,
        duration: stateTracker.movie.duration,
        control: stateTracker.pillController,
        onCompleted: () => stateTracker.onAnimationCompleted(),
        builder: (context, value, child) => AnimatedOpacity(
          opacity: stateTracker.showWidget ? 1 : 0,
          duration: Seconds.get(1),
          child: Container(
            alignment: Alignment.topLeft,
            // color: Colors.blue.withOpacity(.4),
            width: widget.size.width,
            height: widget.size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomPaint(
                painter: GestureCrossPainter(
                  currentPath,
                  widget.size,
                  currentPath.getBounds(),
                  centerCircleOpacity: value.get('center circle opacity'),
                  firstGradientColor: value.get('first gradient color'),
                  secondGradientColor: value.get('second gradient color'),
                  upperCircleLinearGradient: [
                    value.get('top circle color 1'),
                    value.get('top circle color 2'),
                  ],
                  centerCircleAnimationConstant:
                      value.get('center circle constant'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
