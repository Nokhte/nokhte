// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/smart_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'purpose_session_phase2_widgets_coordinator.g.dart';

class PurposeSessionPhase2WidgetsCoordinator = _PurposeSessionPhase2WidgetsCoordinatorBase
    with _$PurposeSessionPhase2WidgetsCoordinator;

abstract class _PurposeSessionPhase2WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final SmartTextStore errorText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore unsubmittedGestureCross;
  final GestureCrossStore submittedGestureCross;
  final TextEditorStore textEditor;
  final NokhteBlurStore nokhteBlur;

  _PurposeSessionPhase2WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.primarySmartText,
    required this.wifiDisconnectOverlay,
    required this.submittedGestureCross,
    required this.errorText,
    required this.nokhteBlur,
    required this.unsubmittedGestureCross,
    required this.textEditor,
  });

  final timerLength =
      kDebugMode ? const Duration(seconds: 45) : const Duration(minutes: 5);

  @action
  constructor() {
    errorText.setMessagesData(MessagesData.purposeSessionPhase2ErrorList);
    errorText.startRotatingText();
    unsubmittedGestureCross.setPhase2PurposeSession();
    submittedGestureCross.setPhase2PurposeSession();
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    primarySmartText.setMessagesData(MessagesData.purposeSessionPhase2List);
    primarySmartText.startRotatingText();
    textEditor.toggleWidgetVisibility();
  }

  @observable
  bool timesUpCallbackHasBeenCalled = false;

  @observable
  bool isOverThreeWords = false;

  @observable
  bool isFirstTimeOverThreeWords = true;

  @observable
  bool hasCompletedIntroduction = false;

  @action
  initReactors({
    required Function onKeyboardUp,
    required Function onKeyboardDown,
    required Function onTimesUp,
    required Function onSwipeUpCompleted,
  }) {
    smartTextIndexReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: () {
        setIsDisconnected(false);
      },
      onDisconnected: () {
        setIsDisconnected(true);
      },
    );
    textEditor.focusNode.addListener(() {
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text
            .split(' ')
            .length
            .isGreaterThanOrEqualTo(3)) {
          isOverThreeWords = true;
        } else {
          isOverThreeWords = false;
        }
        onKeyboardDown();
      } else {
        onKeyboardUp();
      }
    });
    threeWordsReactor();
    submittedGestureCrossReactor();
    unsubmittedGestureCrossReactor(onSwipeUpCompleted);
    errorTextReactor();
    wifiDisconnectOverlayReactor();
    beachWavesMovieStatusReactor(onTimesUpCompleted: onTimesUp);
  }

  @action
  onInactive() {
    if (!isDisconnected) {
      primarySmartText.reset();
    }
  }

  @action
  onResumed() {
    if (!isDisconnected) {
      primarySmartText.startRotatingText();
    }
  }

  @action
  onSwipeUp({bool collaboratorIsFinished = false}) {
    textEditor.toggleWidgetVisibility();
    unsubmittedGestureCross.initMoveAndRegenerate(CircleOffsets.top);
    if (!collaboratorIsFinished) {
      if (primarySmartText.currentIndex == 3) {
        primarySmartText.startRotatingText(isResuming: true);
      }
    }
  }

  @action
  onSwipeDown() {
    submittedGestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
    if (primarySmartText.currentIndex == 4) {
      primarySmartText.startRotatingText(isResuming: true);
    }
  }

  @action
  initTimer() {
    beachWaves.currentStore.initMovie(timerLength);
    beachWaves.currentStore.setControl(Control.play);
    primarySmartText.setAltMovie(timerLength);
    primarySmartText.setAltControl(Control.playFromStart);
    primarySmartText.setAltControl(Control.play);
  }

  @action
  resumeTimer() {
    beachWaves.currentStore.setControl(Control.play);
    primarySmartText.setAltControl(Control.play);
  }

  @action
  pausetimer() {
    beachWaves.currentStore.setControl(Control.play);
    beachWaves.currentStore.setControl(Control.stop);
    primarySmartText.setAltControl(Control.play);
    primarySmartText.setAltControl(Control.stop);
  }

  @action
  onCollaboratorJoined() {
    errorText.startRotatingText(isResuming: true);
    nokhteBlur.reverse();
  }

  @action
  onCollaboratorLeft() {
    nokhteBlur.init();
    errorText.startRotatingText(isResuming: true);
  }

  @action
  onEarlyRelease() {
    primarySmartText.toggleWidgetVisibility();
    beachWaves
        .setMovieMode(BeachWaveMovieModes.timesUpDynamicPointToTimesUpStart);
    beachWaves.currentStore.initMovie([
      ColorAndStop(beachWaves.currentAnimationValues[1],
          beachWaves.currentAnimationValues[9]),
      ColorAndStop(beachWaves.currentAnimationValues[2],
          beachWaves.currentAnimationValues[10]),
      ColorAndStop(beachWaves.currentAnimationValues[3],
          beachWaves.currentAnimationValues[11]),
      ColorAndStop(beachWaves.currentAnimationValues[4],
          beachWaves.currentAnimationValues[12]),
      ColorAndStop(beachWaves.currentAnimationValues[5],
          beachWaves.currentAnimationValues[13]),
      ColorAndStop(beachWaves.currentAnimationValues[6],
          beachWaves.currentAnimationValues[14]),
      ColorAndStop(beachWaves.currentAnimationValues[7],
          beachWaves.currentAnimationValues[15]),
      ColorAndStop(beachWaves.currentAnimationValues[8],
          beachWaves.currentAnimationValues[16]),
    ]);
  }

  wifiDisconnectOverlayReactor() =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          if (p0 == MovieStatus.finished) {
            primarySmartText.resume();
          }
        } else if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
          if (p0 == MovieStatus.inProgress) {
            primarySmartText.pause();
          }
        }
      });

  errorTextReactor() => reaction((p0) => errorText.currentIndex, (p0) {
        if (p0 == 2) {
          errorText.setCurrentIndex(0);
        }
      });

  submittedGestureCrossReactor() =>
      reaction((p0) => submittedGestureCross.centerCrossNokhte.movieStatus,
          (p0) {
        if (p0 == MovieStatus.finished) {
          unsubmittedGestureCross.toggleAll();
          textEditor.toggleWidgetVisibility();
          submittedGestureCross.toggleAll();
        }
      });

  unsubmittedGestureCrossReactor(Function onSwipeUpCompleted) =>
      reaction((p0) => unsubmittedGestureCross.centerCrossNokhte.movieStatus,
          (p0) async {
        if (p0 == MovieStatus.finished) {
          unsubmittedGestureCross.toggleAll();
          submittedGestureCross.toggleAll();
          await onSwipeUpCompleted();
        }
      });

  smartTextIndexReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 1) {
          textEditor.toggleWidgetVisibility();
        } else if (p0 == 3 && !hasCompletedIntroduction) {
          hasCompletedIntroduction = true;
          textEditor.toggleWidgetVisibility();
        } else if (p0 == 5) {
          primarySmartText.setCurrentIndex(3);
        }
      });

  threeWordsReactor() => reaction((p0) => isOverThreeWords, (p0) {
        if (p0) {
          if (isFirstTimeOverThreeWords) {
            textEditor.toggleWidgetVisibility();
            unsubmittedGestureCross.toggleAll();

            primarySmartText.startRotatingText(isResuming: true);
            isFirstTimeOverThreeWords = false;
          } else {
            unsubmittedGestureCross.toggleAll();
          }
        } else {
          unsubmittedGestureCross.toggleAll();
        }
      });

  beachWavesMovieStatusReactor({
    required Function onTimesUpCompleted,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
            timesUpCallbackHasBeenCalled = true;
            beachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToTheDepths);
            beachWaves.currentStore.initMovie(NoParams());
            if (textEditor.showWidget) {
              textEditor.toggleWidgetVisibility();
            }
            if (primarySmartText.currentIndex == 2) {
              primarySmartText.toggleWidgetVisibility();
            }
            if (unsubmittedGestureCross.cross.showWidget) {
              unsubmittedGestureCross.toggleAll();
            }
            if (submittedGestureCross.cross.showWidget) {
              submittedGestureCross.toggleAll();
            }
            await onTimesUpCompleted();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.timesUpEndToTheDepths) {
            Timer.periodic(Seconds.get(0, milli: 100), (timer) async {
              if (!isDisconnected) {
                Modular.to.navigate('/purpose_session/phase_three');
                timer.cancel();
              }
            });
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.timesUpDynamicPointToTimesUpStart) {
            Timer.periodic(Seconds.get(0, milli: 100), (timer) async {
              if (!isDisconnected) {
                print("navigate away!!");
                Modular.to.navigate('/purpose_session/phase_three');
                timer.cancel();
              }
            });
          }
        }
      });
}
