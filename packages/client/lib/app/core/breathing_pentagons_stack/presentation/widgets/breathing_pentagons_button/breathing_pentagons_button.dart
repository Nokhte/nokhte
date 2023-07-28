/// breathing_pentagons_button.dart
// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          startPosition: 0,
          control: stateTrackerStore.controlType,
          onStarted: () {
            print('START  ${stateTrackerStore.movieCount}');
          },
          onCompleted: () {
            // if (stateTrackerStore.movieCount == 1) {
            if (stateTrackerStore.movieCount >= 1) return;
            stateTrackerStore.expansionIsDone();
            // }
            // if (stateTrackerStore.movieCount == 0) {
            //   stateTrackerStore.expansionIsDone();
            // }
            // print(
            //     'END  ${stateTrackerStore.movieCount} ${stateTrackerStore.currentMovie}');
            // if (stateTrackerStore.isExpansionDone == true &&
            //     stateTrackerStore.areColorChangesDone == false) {
            //   stateTrackerStore.colorChangesAreDone();
            // }
            // if (stateTrackerStore.isExpansionDone == false) {
            //   stateTrackerStore.expansionIsDone();
            // }
            // print(
            //     'expansion var ${stateTrackerStore.areColorChangesDone} color changes var ${stateTrackerStore.areColorChangesDone}');
          },
          builder: (context, value, child) {
            return CustomPaint(
              size: size,
              painter: BreathingPentagonsPainter(
                angle: value.get(
                  'angle',
                ),
                scale: value.get(
                  'scale',
                ),
                firstPentagonFirstGradient: value.get(
                  '1st Pentagon > 1st Gradient Color',
                ),
                firstPentagonSecondGradient: value.get(
                  '1st Pentagon > 2nd Gradient Color',
                ),
                secondPentagonFirstGradient: value.get(
                  '2nd Pentagon > 1st Gradient Color',
                ),
                secondPentagonSecondGradient: value.get(
                  '2nd Pentagon > 2nd Gradient Color',
                ),
                thirdPentagonFirstGradient: value.get(
                  '3rd Pentagon > 1st Gradient Color',
                ),
                thirdPentagonSecondGradient: value.get(
                  '3rd Pentagon > 2nd Gradient Color',
                ),
              ),
            );
          });
    });
  }
}
