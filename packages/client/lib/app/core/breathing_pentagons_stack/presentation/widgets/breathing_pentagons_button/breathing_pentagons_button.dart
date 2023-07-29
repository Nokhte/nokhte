/// breathing_pentagons_button.dart
// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/types/types.dart';
import 'package:primala/app/core/breathing_pentagons_stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
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
          // startPosition: 0.0,
          control: stateTrackerStore.controlType,
          onCompleted: () {
            if (stateTrackerStore.mode == MovieModes.windDown) {
              stateTrackerStore.runReverseMovie();
            } else if (stateTrackerStore.mode ==
                MovieModes.aggressiveExpansion) {
              stateTrackerStore.initiateInfiniteRotation();
            }
          },
          builder: (context, value, child) {
            final currentAngle = value.get('angle');
            final currentScale = value.get('scale');
            final currentFirstPentagonFirstGradient =
                value.get('1st Pentagon > 1st Gradient Color');
            final currentFirstPentagonSecondGradient =
                value.get('1st Pentagon > 2nd Gradient Color');
            final currentSecondPentagonFirstGradient =
                value.get('2nd Pentagon > 1st Gradient Color');
            final currentSecondPentagonSecondGradient =
                value.get('2nd Pentagon > 2nd Gradient Color');
            final currentThirdPentagonFirstGradient =
                value.get('3rd Pentagon > 1st Gradient Color');
            final currentThirdPentagonSecondGradient =
                value.get('3rd Pentagon > 2nd Gradient Color');
            if (stateTrackerStore.mode == MovieModes.windDown) {
              stateTrackerStore.teeReverseMovieUp(
                angle: currentAngle,
                scale: currentScale,
                firstPentagonFirstGradient: currentFirstPentagonFirstGradient,
                firstPentagonSecondGradient: currentFirstPentagonSecondGradient,
                secondPentagonFirstGradient: currentSecondPentagonFirstGradient,
                secondPentagonSecondGradient:
                    currentSecondPentagonSecondGradient,
                thirdPentagonFirstGradient: currentThirdPentagonFirstGradient,
                thirdPentagonSecondGradient: currentThirdPentagonSecondGradient,
              );
            }

            return CustomPaint(
              size: size,
              painter: BreathingPentagonsPainter(
                angle: currentAngle,
                scale: currentScale,
                firstPentagonFirstGradient: currentFirstPentagonFirstGradient,
                firstPentagonSecondGradient: currentFirstPentagonSecondGradient,
                secondPentagonFirstGradient: currentSecondPentagonFirstGradient,
                secondPentagonSecondGradient:
                    currentSecondPentagonSecondGradient,
                thirdPentagonFirstGradient: currentThirdPentagonFirstGradient,
                thirdPentagonSecondGradient: currentThirdPentagonSecondGradient,
              ),
            );
          });
    });
  }
}
