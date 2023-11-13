// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_perspectives_widgets_store.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'collective_session_phase1_widgets_coordinator.g.dart';

class CollectiveSessionPhase1WidgetsCoordinator = _CollectiveSessionPhase1WidgetsCoordinatorBase
    with _$CollectiveSessionPhase1WidgetsCoordinator;

abstract class _CollectiveSessionPhase1WidgetsCoordinatorBase
    extends BasePerspectivesWidgetsStore with Store {
  final AudioClipPlatformTrackerStore audioClipPlatform;
  _CollectiveSessionPhase1WidgetsCoordinatorBase({
    required this.audioClipPlatform,
    required super.beachHorizonWater,
    required super.beachSky,
    required super.perspectivesMap,
    required super.collaborativeTextEditor,
    required super.beachWaves,
  });

  textChangeAndFadeIn(String newText) => Future.delayed(Seconds.get(2), () {
        setText(newText);
        collaborativeTextEditor.toggleWidgetVisibility();
      });

  markUpPerspectivesMap(int chosenIndex, String currentPerspective) {
    moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: true);
    textChangeAndFadeIn(currentPerspective);
  }

  transitionToListeningMode() {
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

  // markUpPerspectivesMap
}
