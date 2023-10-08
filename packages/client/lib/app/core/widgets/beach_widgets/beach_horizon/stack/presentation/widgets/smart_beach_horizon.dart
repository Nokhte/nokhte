// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/beach_widgets/beach_waves/stack/utils/get_current_water_animation.dart';
import '../mobx/beach_horizon_tracker_store.dart';
import 'canvas/beach_horizon_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class SmartBeachHorizon extends StatelessWidget {
  // final Size size;
  final BeachHorizonTrackerStore stateTrackerStore;
  const SmartBeachHorizon({
    super.key,
    // required this.size,
    required this.stateTrackerStore,
  });
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder<Movie>(
        tween: stateTrackerStore.movie,
        duration: stateTrackerStore.movie.duration,
        control: stateTrackerStore.control,
        builder: (context, value, child) {
          final currentAnimationValues = GetCurrentWaterAnimation.values(value);
          return CustomPaint(
            painter: BeachHorizonPainter(
              waterValue: currentAnimationValues[0],
              firstGradientColor: currentAnimationValues[1],
              secondGradientColor: currentAnimationValues[2],
              thirdGradientColor: currentAnimationValues[3],
              fourthGradientColor: currentAnimationValues[4],
              fifthGradientColor: currentAnimationValues[5],
              sixthGradientColor: currentAnimationValues[6],
              seventhGradientColor: currentAnimationValues[7],
              eighthGradientColor: currentAnimationValues[8],
              firstGradientStop: currentAnimationValues[9],
              secondGradientStop: currentAnimationValues[10],
              thirdGradientStop: currentAnimationValues[11],
              fourthGradientStop: currentAnimationValues[12],
              fifthGradientStop: currentAnimationValues[13],
              sixthGradientStop: currentAnimationValues[14],
              seventhGradientStop: currentAnimationValues[15],
              eighthGradientStop: currentAnimationValues[16],
            ),
            size: MediaQuery.of(context).size,
          );
        },
      );
    });
  }
}
