// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:nokhte/app/modules/session_starters/constants/constants.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_starter_widgets_coordinator.g.dart';

class SessionStarterWidgetsCoordinator = _SessionStarterWidgetsCoordinatorBase
    with _$SessionStarterWidgetsCoordinator;

abstract class _SessionStarterWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, Reactions, BaseWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final SmartTextStore secondarySmartText;
  final SmartTextStore primarySmartText;
  final GestureCrossStore gestureCross;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore presetsInstructionalNokhte;
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  final PresetIconsStore presetIcons;
  final NokhteBlurStore nokhteBlur;
  final NokhteQrCodeStore qrCode;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionStarterWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.touchRipple,
    required this.presetIcons,
    required this.gestureCross,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.homeInstructionalNokhte,
    required this.presetsInstructionalNokhte,
    required this.nokhteBlur,
    required this.qrCode,
  }) {
    initBaseWidgetsCoordinatorActions();
    presetIcons.setContainerSize(.2);
    presetIcons.setWidgetVisibility(false);
    presetIcons.setIsHorizontal(true);
    initSmartTextActions();
    setSmartTextTopPaddingScalar(.27);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedDown = false;

  @observable
  bool showSecondaryBeachWaves = false;

  @observable
  bool hasInitiatedBlur = false;

  @action
  setShowSecondaryBeachWaves(bool value) => showSecondaryBeachWaves = value;

  @observable
  bool invitationIsSent = false;

  @observable
  ObservableList<Widget> tags = ObservableList.of([]);

  @observable
  bool shouldDisableTouchRipple = false;

  @observable
  bool shouldEnterCollaboratorPool = false;

  @action
  toggleShouldEnterCollaboratorPool() =>
      shouldEnterCollaboratorPool = !shouldEnterCollaboratorPool;

  @action
  toggleInvitationIsSent() => invitationIsSent = !invitationIsSent;

  @action
  constructor(Offset centerParam) {
    setCenter(centerParam);
    qrCode.setWidgetVisibility(false);
    gestureCross.setCollaborationHomeScreen();
    primarySmartText.setMessagesData(SharedLists.emptyList);
    secondarySmartText.setMessagesData(SessionStartersList.hasDoneInstructions);
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
    beachWaves.currentStore.setControl(Control.playFromStart);
    secondarySmartText.startRotatingText();
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    initReactors();
  }

  @action
  onQrCodeReceived(String qrCodeData) {
    qrCode.setQrCodeData(qrCodeData);
    qrCode.setWidgetVisibility(true);
  }

  @action
  onPreferredPresetReceived({
    required String sessionName,
    required List tags,
  }) {
    primarySmartText
        .setMessagesData(SessionStartersList.getQrCodeSubtitle(sessionName));
    primarySmartText.startRotatingText();
    presetIcons.setTags(tags: tags);
  }

  @action
  onSwipeDown(Function onLeaving) async {
    if (centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        setSmartTextBottomPaddingScalar(.1);
        setSmartTextTopPaddingScalar(0);
        secondarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte
            .initMovie(InstructionalNokhtePositions.bottom);
        presetsInstructionalNokhte.setWidgetVisibility(false);
        delayedEnableTouchFeedback();
      } else {
        if (!hasSwipedDown) {
          hasSwipedDown = true;
          primarySmartText.setWidgetVisibility(false);
          presetIcons.setWidgetVisibility(false);
          secondarySmartText.setWidgetVisibility(false);
          homeInstructionalNokhte.setWidgetVisibility(false);
          centerInstructionalNokhte.setWidgetVisibility(false);
          gestureCross.fadeIn();
          gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
          beachWaves.setMovieMode(
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive);
          beachWaves.currentStore
              .initMovie(beachWaves.currentAnimationValues.first);
          qrCode.setWidgetVisibility(false);
          await onLeaving();
        }
      }
    }
  }

  @action
  onSwipeRight(Function onLeaving) async {
    if (centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        setSmartTextBottomPaddingScalar(.2);
        setSmartTextTopPaddingScalar(0);
        secondarySmartText.setCurrentIndex(2);
        secondarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.left);
        homeInstructionalNokhte.setWidgetVisibility(false);
        delayedEnableTouchFeedback();
      } else {
        if (!hasSwipedDown) {
          hasSwipedDown = true;
          primarySmartText.setWidgetVisibility(false);
          presetIcons.setWidgetVisibility(false);
          secondarySmartText.setWidgetVisibility(false);
          homeInstructionalNokhte.setWidgetVisibility(false);
          centerInstructionalNokhte.setWidgetVisibility(false);
          gestureCross.fadeIn();
          gestureCross.cross.initOutlineFadeIn();
          gestureCross.initMoveAndRegenerate(CircleOffsets.left);
          beachWaves.setMovieMode(
              BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue);
          beachWaves.currentStore
              .initMovie(beachWaves.currentAnimationValues.first);
          qrCode.setWidgetVisibility(false);
          await onLeaving();
        }
      }
    }
  }

  @action
  onSwipeCoordinatesChanged(Offset offset) {
    if (!shouldDisableTouchRipple) {
      if ((beachWaves.movieStatus != MovieStatus.finished) ||
          secondarySmartText.currentIndex == 1) {
        touchRipple.onSwipe(offset);
      }
    }
  }

  initReactors() {
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(primarySmartTextReactor());
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          setSmartTextTopPaddingScalar(.27);
          setSmartTextBottomPaddingScalar(0);
          setSmartTextSubMessagePaddingScalar(110);
          secondarySmartText.startRotatingText();
          resetSmartText();
          qrCode.setWidgetVisibility(true);
          hasSwipedDown = false;
          setTouchIsDisabled(false);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
          homeInstructionalNokhte.setWidgetVisibility(false);
          presetsInstructionalNokhte.setWidgetVisibility(false);
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
            beachWaves.currentStore.setControl(Control.playFromStart);
            qrCode.setWidgetVisibility(true);
            secondarySmartText.startRotatingText();
            disposers.add(centerCrossNokhteReactor());
            disposers.add(gestureCrossTapReactor());
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShore) {
            beachWaves.currentStore.setControl(Control.mirror);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive) {
            Modular.to.navigate(SessionStarterConstants.sessionStarterExit);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea) {
            Modular.to.navigate(SessionConstants.lobby, arguments: {
              SessionStarterConstants.QR_CODE_DATA: qrCode.qrCodeData,
            });
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue) {
            Modular.to.navigate(PresetsConstants.presets);
          }
        }
      });

  primarySmartTextReactor() => reaction(
        (p0) => primarySmartText.currentIndex,
        (p0) {
          if (beachWaves.movieMode == BeachWaveMovieModes.invertedOnShore &&
              primarySmartText.showWidget) {
            if (p0 == 0) {
              primarySmartText.startRotatingText(isResuming: true);
            } else if (p0 == 2) {
              presetIcons.setWidgetVisibility(true);
            } else if (p0 == 3) {
              presetIcons.setWidgetVisibility(false);
              primarySmartText.reset();
              primarySmartText.startRotatingText();
            }
          }
        },
      );

  @action
  initTransition() {
    isEnteringNokhteSession = true;
    shouldDisableTouchRipple = true;
    hasSwipedDown = true;
    beachWaves
        .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    secondarySmartText.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
    presetIcons.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
    presetIcons.setWidgetVisibility(false);
    centerInstructionalNokhte.setWidgetVisibility(false);
    homeInstructionalNokhte.setWidgetVisibility(false);
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  dismissInstructionalNokhte() {
    hasSwipedDown = false;
    qrCode.setWidgetVisibility(false);
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(true);
    homeInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.beachWave,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.bottom,
      ),
    );
    presetsInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.deeperBlue,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.left,
      ),
    );
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    hasInitiatedBlur = false;
    secondarySmartText.reset();
    secondarySmartText.startRotatingText();
    delayedEnableTouchFeedback();
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && readyToInteract) {
      if (!hasInitiatedBlur) {
        setTouchIsDisabled(true);
        hasSwipedDown = false;
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        qrCode.setWidgetVisibility(false);
        hasInitiatedBlur = true;
        gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        homeInstructionalNokhte.setWidgetVisibility(true);
        presetsInstructionalNokhte.setWidgetVisibility(true);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.bottom,
          ),
        );
        presetsInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.deeperBlue,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.left,
          ),
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        primarySmartText.setWidgetVisibility(false);
        presetIcons.setWidgetVisibility(false);
        // secondarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
      } else if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (!touchIsDisabled) {
      if (secondarySmartText.currentIndex == 1 ||
          secondarySmartText.currentIndex == 3) {
        touchRipple.onTap(offset);
        nokhteBlur.reverse();
        setTouchIsDisabled(true);
        beachWaves.currentStore.setControl(Control.mirror);
        hasInitiatedBlur = false;
        secondarySmartText.startRotatingText(isResuming: true);

        Timer(Seconds.get(1, milli: 500), () {
          if (secondarySmartText.currentIndex == 1) {
            centerInstructionalNokhte.moveBackToCross(
              startingPosition: CenterNokhtePositions.bottom,
            );
            presetsInstructionalNokhte.setWidgetVisibility(true);
            presetsInstructionalNokhte.initMovie(
              InstructionalGradientMovieParams(
                center: center,
                colorway: GradientNokhteColorways.deeperBlue,
                direction: InstructionalGradientDirections.shrink,
                position: InstructionalNokhtePositions.left,
              ),
            );
            homeInstructionalNokhte.initMovie(
              InstructionalGradientMovieParams(
                center: center,
                colorway: GradientNokhteColorways.beachWave,
                direction: InstructionalGradientDirections.shrink,
                position: InstructionalNokhtePositions.bottom,
              ),
            );
          } else {
            centerInstructionalNokhte.moveBackToCross(
              startingPosition: CenterNokhtePositions.left,
            );
            presetsInstructionalNokhte.initMovie(
              InstructionalGradientMovieParams(
                center: center,
                colorway: GradientNokhteColorways.deeperBlue,
                direction: InstructionalGradientDirections.shrink,
                position: InstructionalNokhtePositions.left,
              ),
            );
            homeInstructionalNokhte.setWidgetVisibility(true);
            homeInstructionalNokhte.initMovie(
              InstructionalGradientMovieParams(
                center: center,
                colorway: GradientNokhteColorways.beachWave,
                direction: InstructionalGradientDirections.shrink,
                position: InstructionalNokhtePositions.bottom,
              ),
            );
            //
          }
          secondarySmartText.reset();
        });
        hasInitiatedBlur = false;
      }
    } else if (hasInitiatedBlur && readyToInteract) {
      dismissInstructionalNokhte();
      hasSwipedDown = false;
      qrCode.setWidgetVisibility(false);
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.center,
      );
      gestureCross.gradientNokhte.setWidgetVisibility(false);
      gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
      homeInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.beachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.bottom,
        ),
      );
      nokhteBlur.reverse();
      beachWaves.currentStore.setControl(Control.mirror);
      hasInitiatedBlur = false;
      secondarySmartText.reset();
      secondarySmartText.startRotatingText();
      delayedEnableTouchFeedback();
    }
  }

  @action
  resetSmartText() {
    primarySmartText.reset();
    primarySmartText.setWidgetVisibility(true);
    primarySmartText.startRotatingText();
  }

  @computed
  bool get readyToInteract =>
      !isEnteringNokhteSession &&
      !hasSwipedDown &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
