// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
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
  final DeepLinksCoordinator deepLinks;

  _HomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.deepLinks,
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
    deepLinks.listen();
    gestureCross.setHomeScreen();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
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
    onResumed();
  }

  @action
  onDisconnected() {
    onInactive();
  }

  @action
  onResumed() {
    if (clockAnimationHasNotStarted) {
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
      primarySmartText.reset();
      if (!hasSwipedUp) {
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
    primarySmartText.toggleWidgetVisibility();
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
    if (!hasInitiatedBlur) {
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

  @observable
  bool clockAnimationHasNotStarted = true;

  @observable
  bool clockIsVisible = false;

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
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors(Function repeatTheFlow) {
    gestureCrossTapReactor(repeatTheFlow);
    nokhteBlurReactor();
    centerCrossNokhteReactor();
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
    }
  }

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive &&
            !isDisconnected) {
          Modular.to.navigate(
            '/collaboration/',
            arguments:
                deepLinks.listenForOpenedDeepLinkStore.additionalMetadata,
          );
        }
      });
}
