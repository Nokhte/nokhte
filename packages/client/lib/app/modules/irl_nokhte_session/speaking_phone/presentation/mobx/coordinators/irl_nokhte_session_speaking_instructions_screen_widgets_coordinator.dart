// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_speaking_instructions_screen_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinator = _IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final TouchRippleStore touchRipple;
  _IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.wifiDisconnectOverlay,
    required this.touchRipple,
  });

  @observable
  bool disableTouchInput = true;

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
      MirroredTextContentOptions.irlNokhteSessionSpeakingPhone,
    );
    initReactors();
  }

  @action
  initReactors() {
    beachWavesMovieStatusReactor();
  }

  @action
  onTap(Offset tapPosition) {
    if (!disableTouchInput) {
      touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut) {
        toggleCurrentActiveOrientation();
        if (isFirstTap) {
          mirroredText.startRotatingUpsideDown();
          mirroredText.startRotatingRightSideUp(isResuming: true);
        } else if (isStillInMutualInstructionMode) {
          mirroredText.startBothRotatingText(isResuming: true);
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
          disableTouchInput = false;
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
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
