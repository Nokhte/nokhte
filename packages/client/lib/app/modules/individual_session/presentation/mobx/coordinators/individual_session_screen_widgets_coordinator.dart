// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_perspectives_widgets_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'individual_session_screen_widgets_coordinator.g.dart';

class IndividualSessionScreenWidgetsCoordinator = _IndividualSessionScreenWidgetsCoordinatorBase
    with _$IndividualSessionScreenWidgetsCoordinator;

abstract class _IndividualSessionScreenWidgetsCoordinatorBase
    extends BasePerspectivesWidgetsStore with Store {
  final AudioClipPlatformTrackerStore audioClipPlatform;
  final BeachHorizonWaterTrackerStore audioRecordingWater;
  _IndividualSessionScreenWidgetsCoordinatorBase({
    required this.audioClipPlatform,
    required this.audioRecordingWater,
    required super.beachHorizonWater,
    required super.beachSky,
    required super.perspectivesMap,
    required super.collaborativeTextEditor,
    required super.beachWaves,
  }) {
    audioRecordingWater.toggleIsGoingFullSky();
  }

  textChangeAndFadeIn(String newText) => Future.delayed(Seconds.get(2), () {
        setText(newText);
        collaborativeTextEditor.toggleWidgetVisibility();
      });

  markUpPerspectivesMap(int chosenIndex, String currentPerspective) {
    moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: true);
    textChangeAndFadeIn(currentPerspective);
  }

  transitionToRecordingMode() {
    Future.delayed(
        Seconds.get(1), () => beachSky.control = Control.playReverseFromEnd);
    beachHorizonWater.fullSkyBackToShorePreReq(currentTime: DateTime.now());
    collaborativeTextEditor.toggleWidgetVisibility();
    perspectivesMap.toggleWidgetVisibility();
    audioClipPlatform.toggleWidgetVisibility();
  }

  transitionBackToPerspectivesMode() {
    beachSky.control = Control.playFromStart;
    Future.delayed(Seconds.get(1),
        () => beachHorizonWater.control = Control.playReverseFromEnd);
    collaborativeTextEditor.toggleWidgetVisibility();
    perspectivesMap.toggleWidgetVisibility();
    audioClipPlatform.toggleWidgetVisibility();
  }

  @action
  markUpOrDownTheAudioPlatform(
    int chosenAudioIndex, {
    required bool shouldMoveUp,
  }) {
    final prevIndex =
        shouldMoveUp ? chosenAudioIndex - 1 : chosenAudioIndex + 1;

    audioClipPlatform
        .setMovie(AudioClipPlatformColorAndVertOffsetChange.getMovie(
      startingCircleColors:
          PerspectivesMapAnimationData.getOnlyWhiteArr(prevIndex),
      endingCircleColors:
          PerspectivesMapAnimationData.getOnlyWhiteArr(chosenAudioIndex),
      startingVertOffsets: List.filled(3, 0),
      endingVertOffsets: List.filled(3, 0),
    ));
    audioClipPlatform.control = Control.playFromStart;
  }

  @action
  resetAudioPlatform() {
    audioClipPlatform
        .setMovie(AudioClipPlatformColorAndVertOffsetChange.getMovie(
      startingCircleColors: PerspectivesMapAnimationData.getOnlyWhiteArr(0),
      endingCircleColors: PerspectivesMapAnimationData.getOnlyWhiteArr(0),
      startingVertOffsets: List.filled(3, 0),
      endingVertOffsets: List.filled(3, 0),
    ));
    audioClipPlatform.control = Control.playFromStart;
  }

  @action
  setupWaterImmersion() => audioRecordingWater.setMovie(
        BottomUpImmersionWaters.getMovie(
          WaterColorsAndStops.audioImmersionWater,
        ),
      );

  @action
  startWaterImmersion() => audioRecordingWater.control = Control.playFromStart;
}
