// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_speaking_instructions_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator = _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
  });

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = true;

  @action
  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  @observable
  MirroredTextOrientations currentActiveOrientation =
      MirroredTextOrientations.rightSideUp;

  @observable
  int tapCount = 0;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingInstructions,
    );
    initReactors();
  }

  @action
  initReactors() {
    beachWavesMovieStatusReactor();
    rightSideUpTextIndexReactor();
  }

  @action
  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setWidgetVisibility(mirroredText.pastShowWidget);
  }

  @action
  onTap(Offset tapPosition, {required Function onFlowFinished}) async {
    if (!disableTouchInput) {
      if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
        return;
      } else {
        cooldownStopwatch.reset();
      }
      touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut) {
        toggleCurrentActiveOrientation();
        if (isFirstTap) {
          mirroredText.startRotatingUpsideDown();
          mirroredText.startRotatingRightSideUp(isResuming: true);
        } else if (isStillInMutualInstructionMode) {
          mirroredText.startBothRotatingText(isResuming: true);
          if (isLastTap) {
            await onFlowFinished();
          }
        }
        tapCount++;
      }
    }
  }

  @action
  toggleCurrentActiveOrientation() {
    switch (currentActiveOrientation) {
      case MirroredTextOrientations.rightSideUp:
        currentActiveOrientation = MirroredTextOrientations.upsideDown;
      case MirroredTextOrientations.upsideDown:
        currentActiveOrientation = MirroredTextOrientations.rightSideUp;
      default:
        break;
    }
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf) {
          mirroredText.startRotatingRightSideUp();
          cooldownStopwatch.start();

          disableTouchInput = false;
        }
      });

  rightSideUpTextIndexReactor() =>
      reaction((p0) => mirroredText.primaryRightSideUpText.currentIndex, (p0) {
        if (p0 == 5) {
          Modular.to.navigate("/irl_nokhte_session/speaking");
        }
      });

  @computed
  bool get hasTappedOnTheRightSide =>
      rightSideUpTextIsVisible && hasTappedOnTheBottomHalf ||
      upsideDownTextIsVisible && hasTappedOnTheTopHalf;

  @computed
  bool get rightSideUpTextIsVisible =>
      currentActiveOrientation == MirroredTextOrientations.rightSideUp;

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == TapPlacement.bottomHalf;

  @computed
  bool get upsideDownTextIsVisible =>
      currentActiveOrientation == MirroredTextOrientations.upsideDown;

  @computed
  bool get hasTappedOnTheTopHalf =>
      touchRipple.tapPlacement == TapPlacement.topHalf;

  @computed
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(4);

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get isLastTap => tapCount == 3;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
