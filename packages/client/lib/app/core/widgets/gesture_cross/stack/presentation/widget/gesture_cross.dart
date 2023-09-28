// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:path_morph/path_morph.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_size_calculator.dart';
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
  final scaleRatio = 3.0;
  final GestureCrossStore stateTrackerStore;
  late AnimationController controller;
  late SampledPathData data;

  @override
  initState() {
    super.initState();
    final matrix4 = Matrix4.identity()..scale(scaleRatio, scaleRatio);
    // the cross
    Path path1 = parseSvgPathData(
      "M11.5 23C17.8513 23 23 17.8513 23 11.5V11.5C23 5.14873 28.1487 0 34.5 0H35H35.5C41.8513 0 47 5.14873 47 11.5V11.5C47 17.8513 52.1487 23 58.5 23V23C64.8513 23 70 28.1487 70 34.5V35V35.5C70 41.8513 64.8513 47 58.5 47V47C52.1487 47 47 52.1487 47 58.5V58.5C47 64.8513 41.8513 70 35.5 70H35H34.5C28.1487 70 23 64.8513 23 58.5V58.5C23 52.1487 17.8513 47 11.5 47H10.5V47C4.70101 47 0 42.299 0 36.5V35V34.5C0 28.1487 5.14873 23 11.5 23V23Z",
    ).transform(matrix4.storage);
    // experiment
    // Path path1 = parseSvgPathData(
    //   "M7.34612 10.8215C8.34922 9.51744 9.51744 8.34922 10.8215 7.34612L15.2492 3.94014C18.5706 1.38525 22.6434 0 26.8337 0H31H35.1663C39.3566 0 43.4294 1.38525 46.7508 3.94014L51.1785 7.34612C52.4826 8.34922 53.6508 9.51744 54.6539 10.8215L58.0599 15.2492C60.6147 18.5706 62 22.6434 62 26.8337V31V35.1663C62 39.3566 60.6147 43.4294 58.0599 46.7508L54.6539 51.1785C53.6508 52.4826 52.4826 53.6508 51.1785 54.6539L46.7508 58.0599C43.4294 60.6147 39.3566 62 35.1663 62H31H26.8337C22.6434 62 18.5706 60.6147 15.2492 58.0599L10.8215 54.6539C9.51744 53.6508 8.34922 52.4826 7.34612 51.1785L3.94014 46.7508C1.38525 43.4294 0 39.3566 0 35.1663V31V26.8337C0 22.6434 1.38525 18.5706 3.94014 15.2492L7.34612 10.8215Z",
    // ).transform(matrix4.storage);
    // the circle ==> wierd warping
    // Path path2 = parseSvgPathData(
    //   'M0 35a35 35 0 1 0 70 0a35 35 0 1 0 -70 0',
    // ).transform(matrix4.storage);
    // : circle
    Path path2 = parseSvgPathData(
      "M35 0h0s35 0 35 35v0s0 35 -35 35h0s-35 0 -35 -35v0s0 -35 35 -35",
      // THE DELTA
      // "M19.2305 27.5L32.7305 0L45.2305 27.5L53.7305 48.5L63.2305 71.5L32.7305 58L0.730469 71.5L9.73047 48.5L19.2305 27.5Z",
    ).transform(matrix4.storage);

    data = PathMorph.samplePaths(path1, path2);
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    PathMorph.generateAnimations(controller, data, func);
    controller.play(duration: const Duration(seconds: 1));
  }

  void func(int i, Offset z) {
    setState(() {
      data.shiftedPoints[i] = z;
    });
  }

  _GestureCrossState({
    required this.size,
    required this.stateTrackerStore,
  }) {
    //
  }

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
              data,
            ),
          ),
        ),
      ),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Observer(builder: (context) {
  //     return CustomAnimationBuilder<Movie>(
  //         tween: stateTrackerStore.movie,
  //         duration: stateTrackerStore.movie.duration,
  //         control: stateTrackerStore.control,
  //         // onCompleted: () => stateTrackerStore.onCompletedAnimationCallback(),
  //         builder: (context, value, child) {
  //           return Observer(builder: (context) {
  //             return AnimatedOpacity(
  //               // opacity: stateTrackerStore.showWidget ? 1 : 0,
  //               opacity: 1,
  //               duration: const Duration(),
  //               child: CustomPaint(
  //                 size: size,
  //                 painter: GestureCrossPainter(
  //                   animationVal: value.get('value'),
  //                 ),
  //               ),
  //             );
  //           });
  //         });
  //   });
  // }

