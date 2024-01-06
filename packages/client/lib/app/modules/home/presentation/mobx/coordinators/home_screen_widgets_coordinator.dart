// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

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

  @observable
  bool wantsToRepeatInvitationFlow = false;

  @action
  toggleWantsToRepeatInvitationFlow() =>
      wantsToRepeatInvitationFlow = !wantsToRepeatInvitationFlow;

  @action
  toggleHasCompletedInvitationFlow() =>
      hasCompletedInvitationFlow = !hasCompletedInvitationFlow;

  @observable
  bool hasSwipedUp = false;

  @observable
  bool gracePeriodHasExpired = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @action
  toggleHasSwipedUp() => hasSwipedUp = !hasSwipedUp;

  @action
  constructor() {
    gestureCross.setHomeScreen();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    secondarySmartText.setMessagesData(MessagesData.firstTimeSecondaryHomeList);
  }

  @action
  invitationFlowConstructor() {
    primarySmartText.startRotatingText();
  }

  @action
  postInvitationFlowConstructor() {
    toggleHasCompletedInvitationFlow();
    Future.delayed(Seconds.get(3), () {
      if (!hasSwipedUp) {
        gestureCross.startBlinking();
        primarySmartText.startRotatingText();
        toggleGracePeriodHasExpired();
      }
    });
  }

  @action
  onConnected() {
    if (primarySmartText.isPaused &&
        wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
      if (primarySmartText.currentIndex.isLessThan(3)) {
        primarySmartText.resume();
      }
      if (isDisconnected) toggleIsDisconnected();
    }
  }

  @action
  onDisconnected() {
    if (!isDisconnected) toggleIsDisconnected();
    if (!primarySmartText.isPaused) {
      if (primarySmartText.currentIndex.isLessThan(3)) {
        primarySmartText.pause();
      }
    }
    if (hasSwipedUp) {
      beachWaves.currentStore.setControl(Control.playReverse);
    }
  }

  @action
  onResumed() {
    if (clockAnimationHasNotStarted) {
      primarySmartText.resume();
      primarySmartText.startRotatingText();
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
    if (hasInitiatedBlur) {
      beachWaves.finishedCount = 1;
    }
    gestureCross.stopBlinking();
    primarySmartText.toggleWidgetVisibility();
    timeModel.toggleWidgetVisibility();
    if (secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
    beachWaves.setMovieStatus(MovieStatus.inProgress);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    gestureCross.initMoveAndRegenerate(CircleOffsets.top);
  }

  @action
  onSwipeUp() {
    if (!isDisconnected) {
      if (primarySmartText.currentIndex.equals(4) &&
          !hasSwipedUp &&
          !hasCompletedInvitationFlow) {
        prepForNavigation();
      } else if (!hasSwipedUp && hasCompletedInvitationFlow) {
        prepForNavigation(excludeUnBlur: true);
      }
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

  initReactors(Function repeatTheFlow) {
    primarySmartTextReactor();
    gestureCrossTapReactor(repeatTheFlow);
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
    clockFaceAnimationStatusReactor();
    availabilitySectorsMovieStatusReactor();
    nokhteBlurReactor();
    centerCrossNokhteReactor();
    wifiDisconnectOverlayReactor();
    availabilitySectorReactor();
    beachWavesMovieStatusReactor();
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });

  gestureCrossTapReactor(Function repeatTheFlow) => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(repeatTheFlow),
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
          if (isDisconnected) toggleIsDisconnected();
          if (primarySmartText.isPaused) {
            primarySmartText.resume();
          }

          if (hasSwipedUp) {
            beachWaves.currentStore.setControl(Control.playFromStart);
            beachWaves.setMovieStatus(MovieStatus.inProgress);
          }
        }
      });

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

  availabilitySectorReactor() =>
      reaction((p0) => timeModel.availabilitySectors.tapCount, (p0) {
        if (!isDoubleTriggeringWindDown && !isDisconnected) {
          timeModel.availabilitySectors.initJoinAndFadeOutMovie();
          toggleIsDoubleTriggeringWindDown();
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive &&
            !isDisconnected) {
          Modular.to.navigate('/collaboration/');
        }
      });

  @action
  onGestureCrossTap(Function repeatTheFlow) {
    if (!isDisconnected && !hasInitiatedBlur) {
      if (hasCompletedInvitationFlow) {
        repeatTheFlow();
        toggleWantsToRepeatInvitationFlow();
        gestureCross.stopBlinking();
        if (!gracePeriodHasExpired) {
          primarySmartText.setCurrentIndex(1);
        }
      }
      nokhteBlur.init();
      primarySmartText.startRotatingText(isResuming: true);
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
    }
  }

  @action
  onClockFaceAnimationFinished(p0) {
    if (p0 == MovieStatus.finished) {
      if (timeModel.clockFace.pastControl == Control.playReverseFromEnd) {
        Timer.periodic(Seconds.get(0, milli: 100), (timer) {
          if (!primarySmartText.isPaused) {
            primarySmartText.startRotatingText(isResuming: true);
            timer.cancel();
          }
        });
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
