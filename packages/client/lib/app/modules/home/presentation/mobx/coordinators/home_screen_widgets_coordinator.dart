// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_widgets_coordinator.g.dart';

class HomeScreenWidgetsCoordinator = _HomeScreenWidgetsCoordinatorBase
    with _$HomeScreenWidgetsCoordinator;

abstract class _HomeScreenWidgetsCoordinatorBase extends Equatable with Store {
  final TimeAlignmentModelCoordinator timeModel;
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;

  _HomeScreenWidgetsCoordinatorBase({
    required this.timeModel,
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.secondarySmartText,
  });

  @observable
  bool hasCompletedInvitationFlow = false;

  @action
  toggleHasCompletedInvitationFlow() =>
      hasCompletedInvitationFlow = !hasCompletedInvitationFlow;

  @observable
  bool hasSwipedUp = false;

  @action
  toggleHasSwipedUp() => hasSwipedUp = !hasSwipedUp;

  @action
  constructor() {
    gestureCross.setHomeScreen();
    primarySmartText.setMessagesData(MessagesData.empty);
    secondarySmartText.setMessagesData(MessagesData.empty);
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
  }

  @action
  invitationFlowConstructor({bool skipFirstMessage = false}) {
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    secondarySmartText.setMessagesData(MessagesData.firstTimeSecondaryHomeList);
    if (skipFirstMessage) {
      primarySmartText.setCurrentIndex(1);
      beachWaves.currentStore.setControl(Control.stop);
      nokhteBlur.init();
    }
    primarySmartText.startRotatingText();
  }

  @action
  postInvitationFlowConstructor() {
    toggleHasCompletedInvitationFlow();
    Future.delayed(Seconds.get(3), () {
      gestureCross.startBlinking();
    });
  }

  @action
  onConnected() {
    if (isDisconnected) toggleIsDisconnected();
  }

  @action
  onDisconnected() {
    if (!isDisconnected) toggleIsDisconnected();
  }

  @action
  onResumed() {
    if (clockAnimationHasNotStarted) {
      primarySmartText.resume();
      primarySmartText.startRotatingText();
      beachWaves.currentStore.setControl(Control.mirror);
      if (hasInitiatedBlur) {
        nokhteBlur.reverse();
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onInactive() {
    if (clockAnimationHasNotStarted) {
      primarySmartText.pause();
      primarySmartText.reset();
    }
  }

  @action
  prepForNavigation({bool excludeUnBlur = false}) {
    toggleHasSwipedUp();
    if (!excludeUnBlur) {
      nokhteBlur.reverse();
    }
    gestureCross.stopBlinking();
    primarySmartText.startRotatingText(isResuming: true);
    beachWaves.currentStore.setControl(Control.mirror);
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDiveSetup);
    gestureCross.initMoveAndRegenerate(CircleOffsets.top);
  }

  @action
  onSwipeUp() {
    if (primarySmartText.currentIndex.equals(4) &&
        !hasSwipedUp &&
        !hasCompletedInvitationFlow) {
      prepForNavigation();
    } else if (!hasSwipedUp && hasCompletedInvitationFlow) {
      prepForNavigation(excludeUnBlur: true);
    }
  }

  @observable
  bool clockAnimationHasNotStarted = true;

  @observable
  bool clockIsVisible = false;

  @observable
  bool isDisconnected = false;

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool isDoubleTriggeringWindDown = false;

  @action
  toggleIsDoubleTriggeringWindDown() =>
      isDoubleTriggeringWindDown = !isDoubleTriggeringWindDown;

  @action
  toggleClockIsVisible() => clockIsVisible = !clockIsVisible;

  @action
  toggleIsDisconnected() => isDisconnected = !isDisconnected;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors(Function resetFlowCompletionStatus) {
    primarySmartTextReactor();
    gestureCrossTapReactor(resetFlowCompletionStatus);
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
    clockFaceAnimationStatusReactor();
    availabilitySectorsMovieStatusReactor();
    nokhteBlurReactor();
    centerCrossNokhteReactor();
    gradientNokhteOpacityListener();
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });

  gradientNokhteOpacityListener() =>
      reaction((p0) => gestureCross.gradientNokhte.hasFadedIn, (p0) {
        if (!gestureCross.gradientNokhte.showWidget && hasSwipedUp) {
          Modular.to.navigate('/collaboration/');
        }
      });

  gestureCrossTapReactor(Function resetFlowCompletionStatus) => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(resetFlowCompletionStatus),
      );

  primarySmartTextReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 3) {
          timeModel.init();
        }
      });

  clockFaceAnimationStatusReactor() => reaction(
      (p0) => timeModel.clockFace.movieStatus,
      (p0) => onClockFaceAnimationFinished(p0));

  availabilitySectorsMovieStatusReactor() => reaction(
      (p0) => timeModel.availabilitySectors.movieStatus,
      (p0) => onAvailabilitySectorMovieStatusFinished(p0));

  wifiDisconnectOverlayReactor() =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          if (clockAnimationHasNotStarted) {
            primarySmartText.resume();
          }
        } else if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
          if (clockAnimationHasNotStarted) {
            primarySmartText.pause();
          }
        }
      });

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

  @action
  onGestureCrossTap(Function resetFlowCompletionStatus) {
    if (!isDisconnected && !hasInitiatedBlur) {
      if (hasCompletedInvitationFlow) {
        gestureCross.stopBlinking();
        invitationFlowConstructor(skipFirstMessage: true);
        resetFlowCompletionStatus();
      } else {
        nokhteBlur.init();
        primarySmartText.startRotatingText(isResuming: true);
        beachWaves.currentStore.setControl(Control.stop);
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onClockFaceAnimationFinished(p0) {
    if (p0 == MovieStatus.finished) {
      if (timeModel.clockFace.pastControl == Control.playReverseFromEnd) {
        primarySmartText.startRotatingText(isResuming: true);
      } else {
        secondarySmartText.startRotatingText();
        toggleClockIsVisible();
      }
    } else if (p0 == MovieStatus.inProgress) {
      clockAnimationHasNotStarted = false;
    }
  }

  @action
  onAvailabilitySectorMovieStatusFinished(MovieStatus p0) {
    if (p0 == MovieStatus.finished &&
        timeModel.availabilitySectors.pastControl == Control.playFromStart) {
      timeModel.reverseClockFaceMovie();
      secondarySmartText.toggleWidgetVisibility();
    }
  }

  @override
  List<Object> get props => [];
}
