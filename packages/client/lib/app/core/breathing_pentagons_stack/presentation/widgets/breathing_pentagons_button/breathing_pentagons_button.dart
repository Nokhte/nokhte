/// breathing_pentagons_button.dart
// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/types/types.dart';
import 'package:primala/app/core/breathing_pentagons_stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/breathing_pentagons_stack/utils/utils.dart';
import 'canvas/breathing_pentagons_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class BreathingPentagonsButton extends StatefulWidget {
  final Size size;
  final BreathingPentagonsStateTrackerStore stateTrackerStore;
  const BreathingPentagonsButton({
    super.key,
    required this.size,
    required this.stateTrackerStore,
  });

  @override
  _BreathingPentagonsAnimationState createState() =>
      _BreathingPentagonsAnimationState(
        size: size,
        stateTrackerStore: stateTrackerStore,
      );
}

class _BreathingPentagonsAnimationState
    extends State<BreathingPentagonsButton> {
  final Size size;
  final BreathingPentagonsStateTrackerStore stateTrackerStore;
  late Animation<double> angle;
  late Animation<double> scale;
  late Control control;
  double startPoint = 0.0;
  _BreathingPentagonsAnimationState(
      {required this.size, required this.stateTrackerStore});

  @override
  void initState() {
    super.initState();
    control = Control.play;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder<Movie>(
          tween: stateTrackerStore.movie,
          duration: stateTrackerStore.movie.duration,
          control: stateTrackerStore.controlType,
          onCompleted: () => stateTrackerStore.onCompletedAnimationCallback(),
          builder: (context, value, child) {
            final currentAnimationValues = GetCurrentAnimation.values(value);
            if (stateTrackerStore.mode == MovieModes.windDown) {
              stateTrackerStore.teeReverseMovieUp(
                angle: currentAnimationValues[0],
                scale: currentAnimationValues[1],
                firstPentagonFirstGradient: currentAnimationValues[2],
                firstPentagonSecondGradient: currentAnimationValues[3],
                secondPentagonFirstGradient: currentAnimationValues[4],
                secondPentagonSecondGradient: currentAnimationValues[5],
                thirdPentagonFirstGradient: currentAnimationValues[6],
                thirdPentagonSecondGradient: currentAnimationValues[7],
              );
            }

            return CustomPaint(
              size: size,
              painter: BreathingPentagonsPainter(
                angle: currentAnimationValues[0],
                scale: currentAnimationValues[1],
                firstPentagonFirstGradient: currentAnimationValues[2],
                firstPentagonSecondGradient: currentAnimationValues[3],
                secondPentagonFirstGradient: currentAnimationValues[4],
                secondPentagonSecondGradient: currentAnimationValues[5],
                thirdPentagonFirstGradient: currentAnimationValues[6],
                thirdPentagonSecondGradient: currentAnimationValues[7],
              ),
            );
          });
    });
  }
}
