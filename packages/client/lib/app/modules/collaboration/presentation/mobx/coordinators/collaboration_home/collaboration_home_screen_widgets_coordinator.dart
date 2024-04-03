// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'collaboration_home_screen_widgets_coordinator.g.dart';

// todo rename this to session sparker
class CollaborationHomeScreenWidgetsCoordinator = _CollaborationHomeScreenWidgetsCoordinatorBase
    with _$CollaborationHomeScreenWidgetsCoordinator;

abstract class _CollaborationHomeScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore primaryBeachWaves;
  final BeachWavesStore secondaryBeachWaves;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final TouchRippleStore touchRipple;

  _CollaborationHomeScreenWidgetsCoordinatorBase({
    required this.primaryBeachWaves,
    required this.touchRipple,
    required this.secondaryBeachWaves,
    required this.gestureCross,
    required this.smartText,
    required super.wifiDisconnectOverlay,
  });

  @observable
  bool showSecondaryBeachWaves = false;

  @action
  setShowSecondaryBeachWaves(bool value) => showSecondaryBeachWaves = value;

  @observable
  bool showQrCode = false;

  @action
  setShowQrCode(bool newVal) => showQrCode = newVal;

  @observable
  bool invitationIsSent = false;

  @observable
  bool shouldEnterCollaboratorPool = false;

  @action
  toggleShouldEnterCollaboratorPool() =>
      shouldEnterCollaboratorPool = !shouldEnterCollaboratorPool;

  @action
  toggleInvitationIsSent() => invitationIsSent = !invitationIsSent;

  @action
  constructor() {
    primaryBeachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
    primaryBeachWaves.currentStore.callsOnCompleteTwice = true;
    primaryBeachWaves.currentStore.initMovie(
      const AnyToOnShoreParams(
        startingColors: WaterColorsAndStops.oceanDiveWater,
        endingColors: WaterColorsAndStops.invertedBeachWater,
      ),
    );
    secondaryBeachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
    gestureCross.setCollaborationHomeScreen();
    smartText.setMessagesData(MessagesData.sessionSparkerList);
  }

  @action
  onResumed() {
    if (smartText.currentIndex.isLessThan(1) &&
        smartText.messagesData.length == 3) {
      smartText.reset();
      smartText.startRotatingText();
    }
  }

  @action
  onInactive() {
    if (smartText.currentIndex.isLessThan(1) &&
        smartText.messagesData.length == 3) {
      smartText.pause();
    }
  }

  @action
  invitationFlowConstructor() {
    // Timer.periodic(Seconds.get(0, milli: 100), (timer) {
    //   if (!smartText.isPaused) {
    //     smartText.startRotatingText();
    //     timer.cancel();
    //   }
    // });
  }

  @action
  postInvitationFlowConstructor() {
    // Timer.periodic(Seconds.get(0, milli: 100), (timer) {
    //   if (!smartText.isPaused) {
    //     smartText.setCurrentIndex(1);
    //     smartText.startRotatingText();
    //     timer.cancel();
    //   }
    // });
  }

  @action
  onNokhteSessionLinkOpened() {
    primaryBeachWaves
        .setMovieMode(BeachWaveMovieModes.oceanDiveToVibrantBlueGradient);
    primaryBeachWaves.currentStore.initMovie(NoParams());
    gestureCross.toggleAll();
    smartText.setWidgetVisibility(false);
  }

  @action
  onSwipeDown() {
    // smartText.pause();
    smartText.setWidgetVisibility(false);
    gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
    primaryBeachWaves
        .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive);
    primaryBeachWaves.currentStore
        .initMovie(primaryBeachWaves.currentAnimationValues.first);
    setShowQrCode(false);
  }

  @action
  onSwipeCoordinatesChanged(Offset offset) {
    if (primaryBeachWaves.movieStatus != MovieStatus.finished ||
        secondaryBeachWaves.movieStatus != MovieStatus.finished) {
      touchRipple.onSwipe(offset);
    }
  }

  initReactors() {
    primaryBeachWavesMovieStatusReactor();
    invitationSendStatusReactor();
    centerCrossNokhteReactor();
  }

  invitationSendStatusReactor() => reaction((p0) => invitationIsSent, (p0) {
        if (p0) {
          smartText.startRotatingText(isResuming: true);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  primaryBeachWavesMovieStatusReactor() =>
      reaction((p0) => primaryBeachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (primaryBeachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            primaryBeachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
            primaryBeachWaves.currentStore.setControl(Control.playFromStart);
            setShowQrCode(true);
            smartText.startRotatingText();
          } else if (primaryBeachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShore) {
            primaryBeachWaves.currentStore.setControl(Control.mirror);
          } else if (primaryBeachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive) {
            setShowSecondaryBeachWaves(true);
            secondaryBeachWaves.currentStore.callsOnCompleteTwice = false;
            secondaryBeachWaves.currentStore.reverseMovie(0);
          } else if (primaryBeachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedVibrantBlueGrad) {
            Modular.to.navigate("/irl_nokhte_session/");
          }
        }
      });

  @action
  initTransition() {
    primaryBeachWaves.setMovieMode(
        BeachWaveMovieModes.invertedOnShoreToInvertedVibrantBlueGrad);
    primaryBeachWaves.currentStore
        .initMovie(primaryBeachWaves.currentAnimationValues.first);
    setShowQrCode(false);
    smartText.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
  }

  secondaryBeachWavesMovieStatusReactor(Function onNavigationHome) =>
      reaction((p0) => secondaryBeachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onNavigationHome();
        }
      });
}
