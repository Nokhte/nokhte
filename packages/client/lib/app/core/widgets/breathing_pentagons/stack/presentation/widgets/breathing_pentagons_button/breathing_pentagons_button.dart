/// breathing_pentagons_button.dart
///
/// Proofreader Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th 2023
///
/// Author: Sonny Vesali
///
/// A custom animated button that displays breathing pentagons with dynamic
/// animations. The button's appearance is controlled by the
/// BreathingPentagonsStateTrackerStore, a MobX-based state management class.
/// The button's animation is managed by the CustomAnimationBuilder from the
/// simple_animations package, which plays different animations based on the
/// current state of the BreathingPentagonsStateTrackerStore.
///
/// Constructor:
/// - BreathingPentagonsButton: Constructs the button with the required
/// parameters.
///
/// Properties:
/// - size: A Size object representing the size of the button.
///
/// - stateTrackerStore: An instance of BreathingPentagonsStateTrackerStore
/// that controls the state and animations of the button.
///
/// State:
/// - _BreathingPentagonsAnimationState: The state class for the
/// BreathingPentagonsButton, responsible for managing the animations and
/// control flow of the button.
///
/// Methods:
/// - initState: Overrides the initState method from State. It is used to set
/// up the initial state of the button, including setting the control to
/// Control.play.
///
/// - build: Overrides the build method from StatefulWidget. It constructs the
/// widget tree for the button, which includes the Observer widget from
/// flutter_mobx, and the CustomAnimationBuilder to manage the animations. The
/// button's appearance and animations are determined by the current values in
/// the BreathingPentagonsStateTrackerStore.
///
/// - _BreathingPentagonsAnimationState: The state class for the
/// BreathingPentagonsButton. It manages the animations and control flow of the
/// button. It includes the animation controllers (angle and scale), the control
/// type, and a startPoint variable. It provides the logic for updating the
/// button's animations and state based on the
/// BreathingPentagonsStateTrackerStore.
///
/// - CustomAnimationBuilder: A widget from simple_animations package used to
/// build animations based on the current state of the
/// BreathingPentagonsStateTrackerStore. It rebuilds the button whenever the
/// animations change or complete.
///
/// - CustomPaint: A widget to paint the breathing pentagons on the canvas
/// using the BreathingPentagonsPainter. The appearance of the pentagons is
/// determined by the current animation values obtained from the
/// BreathingPentagonsStateTrackerStore. The pentagons' size and gradients
/// change dynamically based on the state of the animation.

// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/utils/utils.dart';
import 'canvas/breathing_pentagons_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class BreathingPentagonsButton extends StatefulWidget {
  final Size size;
  final BreathingPentagonsStateTrackerStore stateTrackerStore;
  final Duration fadeInDuration;
  final Duration fadeInDelay;
  const BreathingPentagonsButton({
    super.key,
    required this.size,
    required this.stateTrackerStore,
    required this.fadeInDuration,
    required this.fadeInDelay,
  });

  @override
  _BreathingPentagonsAnimationState createState() =>
      _BreathingPentagonsAnimationState(
        size: size,
        stateTrackerStore: stateTrackerStore,
        fadeInDuration: fadeInDuration,
        fadeInDelay: fadeInDelay,
      );
}

class _BreathingPentagonsAnimationState
    extends State<BreathingPentagonsButton> {
  final Size size;
  final Duration fadeInDuration;
  final Duration fadeInDelay;
  final BreathingPentagonsStateTrackerStore stateTrackerStore;
  late Animation<double> angle;
  late Animation<double> scale;
  late Control control;
  bool showWidget = false;
  double startPoint = 0.0;
  _BreathingPentagonsAnimationState({
    required this.size,
    required this.stateTrackerStore,
    required this.fadeInDuration,
    required this.fadeInDelay,
  });

  @override
  void initState() {
    super.initState();
    control = Control.play;
    Future.delayed(fadeInDelay, () {
      setState(() {
        stateTrackerStore.flipWidgetVisibility();
      });
    });
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

            return Observer(builder: (context) {
              return AnimatedOpacity(
                opacity: stateTrackerStore.showWidget ? 1 : 0,
                duration: fadeInDuration,
                child: CustomPaint(
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
                ),
              );
            });
          });
    });
  }
}
