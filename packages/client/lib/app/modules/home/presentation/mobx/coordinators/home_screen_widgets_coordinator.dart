// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_widgets_coordinator.g.dart';

class HomeScreenWidgetsCoordinator = _HomeScreenWidgetsCoordinatorBase
    with _$HomeScreenWidgetsCoordinator;

abstract class _HomeScreenWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;

  _HomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
  });

  @observable
  bool hasCompletedInvitationFlow = false;

  @observable
  bool wantsToRepeatInvitationFlow = false;

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedUp = false;

  @observable
  bool gracePeriodHasExpired = false;

  @observable
  bool hasCompletedASession = false;

  @observable
  bool hasCompletedQueries = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @action
  toggleHasSwipedUp() => hasSwipedUp = !hasSwipedUp;

  @action
  toggleWantsToRepeatInvitationFlow() =>
      wantsToRepeatInvitationFlow = !wantsToRepeatInvitationFlow;

  @action
  toggleHasCompletedInvitationFlow() =>
      hasCompletedInvitationFlow = !hasCompletedInvitationFlow;

  @action
  constructor() {
    gestureCross.setHomeScreen();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
  }

  @action
  invitationFlowConstructor() {
    primarySmartText.startRotatingText();
    hasCompletedQueries = true;
  }

  @action
  postInvitationFlowConstructor({required bool hasDoneASession}) {
    toggleHasCompletedInvitationFlow();
    if (!hasDoneASession) {
      Future.delayed(Seconds.get(3), () {
        if (!hasSwipedUp) {
          gestureCross.startBlinking();
          primarySmartText.startRotatingText();
          toggleGracePeriodHasExpired();
        }
      });
    } else {
      toggleGracePeriodHasExpired();
      hasCompletedASession = true;
    }
    hasCompletedQueries = true;
  }

  @action
  onConnected() {
    onResumed();
  }

  @action
  onDisconnected() {
    onInactive();
    if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
      isEnteringNokhteSession = false;
      beachWaves.currentStore.setControl(Control.playReverse);
    }
  }

  @action
  onResumed() {
    if (!hasInitiatedBlur) {
      primarySmartText.startRotatingText();
      if (hasInitiatedBlur) {
        nokhteBlur.reverse();
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onInactive() {
    if (!hasInitiatedBlur) {
      primarySmartText.reset();
      if (!hasSwipedUp && beachWaves.movieMode == BeachWaveMovieModes.onShore) {
        beachWaves.currentStore.setControl(Control.mirror);
      }
    }
  }

  @action
  prepForNavigation({bool excludeUnBlur = false}) {
    toggleHasSwipedUp();
    if (!excludeUnBlur) {
      nokhteBlur.reverse();
    }
    gestureCross.stopBlinking();
    if (primarySmartText.currentIndex == 0) {
      primarySmartText.toggleWidgetVisibility();
    } else {
      primarySmartText.startRotatingText(isResuming: true);
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    gestureCross.initMoveAndRegenerate(CircleOffsets.top);
  }

  @action
  onSwipeUp() {
    if (primarySmartText.currentIndex.equals(1) &&
        !hasSwipedUp &&
        !hasCompletedInvitationFlow) {
      prepForNavigation();
    } else if (!hasSwipedUp && hasCompletedInvitationFlow) {
      prepForNavigation(excludeUnBlur: true);
    }
  }

  @action
  onGestureCrossTap(Function repeatTheFlow) {
    if (!hasInitiatedBlur && !isEnteringNokhteSession && hasCompletedQueries) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      if (hasCompletedInvitationFlow || hasCompletedASession) {
        repeatTheFlow();
        toggleWantsToRepeatInvitationFlow();
        gestureCross.stopBlinking();
        if (gracePeriodHasExpired && !hasCompletedASession) {
          primarySmartText.startRotatingText(isResuming: true);
        } else if (!gracePeriodHasExpired ||
            (gracePeriodHasExpired && hasCompletedASession)) {
          primarySmartText.setCurrentIndex(1);
          primarySmartText.startRotatingText();
        }
      } else {
        primarySmartText.startRotatingText(isResuming: true);
      }
    }
  }

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool isDoubleTriggeringWindDown = false;

  @action
  toggleIsDoubleTriggeringWindDown() =>
      isDoubleTriggeringWindDown = !isDoubleTriggeringWindDown;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors(Function repeatTheFlow) {
    gestureCrossTapReactor(repeatTheFlow);
    nokhteBlurReactor();
    centerCrossNokhteReactor();
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

  @action
  onLongReconnected() {
    if (wifiDisconnectOverlay.movieMode ==
        WifiDisconnectMovieModes.removeTheCircle) {
      if (isDisconnected) setIsDisconnected(false);
      if (primarySmartText.isPaused) {
        primarySmartText.resume();
      }
      if (hasSwipedUp) {
        beachWaves.currentStore.setControl(Control.playFromStart);
        beachWaves.setMovieStatus(MovieStatus.inProgress);
      }
      if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
        isEnteringNokhteSession = true;
        beachWaves.currentStore.setControl(Control.playFromStart);
      }
    }
  }

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

  beachWavesMovieStatusReactor(
    Function onShoreToOceanDiveComplete,
    Function onShoreToVibrantBlueComplete,
  ) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            onShoreToOceanDiveComplete();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.onShoreToVibrantBlue) {
            if (isEnteringNokhteSession) {
              onShoreToVibrantBlueComplete();
            } else {
              beachWaves.setMovieStatus(MovieStatus.inProgress);
            }
          }
        } else if (beachWaves.movieStatus == MovieStatus.finished &&
            isEnteringNokhteSession) {
          Modular.to.navigate('/collaboration/pool');
        }
      });

  @action
  onDeepLinkOpened() {
    isEnteringNokhteSession = true;
    primarySmartText.toggleWidgetVisibility();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.initMovie(
      beachWaves.currentAnimationValues.first,
    );
    gestureCross.toggleAll();
  }
}
