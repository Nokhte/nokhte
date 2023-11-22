// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import '../mobx/beach_horizon_water_tracker_store.dart';
import 'canvas/beach_horizon_water_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class BeachHorizonWater extends StatelessWidget {
  final Size size;
  final BeachHorizonWaterTrackerStore stateTrackerStore;
  const BeachHorizonWater({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder(
        tween: stateTrackerStore.movie,
        duration: stateTrackerStore.movie.duration,
        control: stateTrackerStore.control,
        // onStarted: () => stateTrackerStore.startAndResetStopWatch(),
        // onCompleted: () => stateTrackerStore.onAnimationCompleted(),
        builder: (context, value, child) {
          final rectHeight = size.height - value.get('water value');
          stateTrackerStore.setCurrentWaterValue(value.get('water value'));
          final rect = Rect.fromPoints(
            Offset(0, size.height - rectHeight),
            Offset(size.width, size.height),
          );
          return ClipRect(
            clipper: CustomRectClipper(rect),
            child: CustomPaint(
              painter: BeachHorizonWaterPainter(
                stopsList: [
                  value.get('1st Water Gradient Stop'),
                  value.get('2nd Water Gradient Stop'),
                  value.get('3rd Water Gradient Stop'),
                  value.get('4th Water Gradient Stop'),
                  value.get('5th Water Gradient Stop'),
                  value.get('6th Water Gradient Stop'),
                  value.get('7th Water Gradient Stop'),
                  value.get('8th Water Gradient Stop'),
                ],
                colorsList: [
                  value.get('1st Water Gradient Color'),
                  value.get('2nd Water Gradient Color'),
                  value.get('3rd Water Gradient Color'),
                  value.get('4th Water Gradient Color'),
                  value.get('5th Water Gradient Color'),
                  value.get('6th Water Gradient Color'),
                  value.get('7th Water Gradient Color'),
                  value.get('8th Water Gradient Color'),
                ],
              ),
              size: MediaQuery.of(context).size,
            ),
          );
        },
      );
    });
  }
}
