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
    // print(angle);
    // we need to return a MoveBuilder I think and then we will be able to do
    //
    // ultimately we'll have to see if multiple movies or
    // starting point but I lean towards two movies, but things
    // aren't changing but we've dealt with this before so I think we'll be fine

    return Observer(builder: (context) {
      return CustomAnimationBuilder<Movie>(
          tween: stateTrackerStore.movie,
          duration: stateTrackerStore.movie.duration,
          startPosition: stateTrackerStore.startingPoint,
          control: stateTrackerStore.controlType,
          onCompleted: () {
            if (stateTrackerStore.isExpansionDone == false) {
              stateTrackerStore.expansionIsDone();
            }
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
              ),
            );
          });
    });
  }
}
