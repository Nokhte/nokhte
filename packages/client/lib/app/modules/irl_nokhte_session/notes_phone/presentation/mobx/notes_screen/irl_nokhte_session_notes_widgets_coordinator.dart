// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:cron/cron.dart';
import 'package:simple_animations/simple_animations.dart';
part 'irl_nokhte_session_notes_widgets_coordinator.g.dart';

class IrlNokhteSessionNotesWidgetsCoordinator = _IrlNokhteSessionNotesWidgetsCoordinatorBase
    with _$IrlNokhteSessionNotesWidgetsCoordinator;

abstract class _IrlNokhteSessionNotesWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final SmartTextStore smartText;
  final BorderGlowStore borderGlow;
  final MirroredTextStore mirroredText;
  _IrlNokhteSessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
    required this.borderGlow,
    required this.mirroredText,
  });

  @observable
  bool showSubmitText = false;

  @observable
  bool canSwipeUp = true;

  @observable
  bool canTap = false;

  @action
  setCanSwipeUp(bool newVal) => canSwipeUp = newVal;

  @action
  setShowSubmitText(bool newVal) => showSubmitText = newVal;

  @action
  constructor() {
    smartText.setMessagesData(MessagesData.notesSessionPrimaryList);
    smartText.setWidgetVisibility(false);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    textEditor.initFadeIn();
    mirroredText.setMessagesData(MirroredTextContentOptions.speakLessWriteMore);
    initReactors();
  }

  initReactors() {
    textEditor.focusNode.addListener(() {
      if (!textEditor.focusNode.hasFocus) {
        startInactivityCron();
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        } else {
          smartText.setWidgetVisibility(false);
        }
      } else {
        smartText.setWidgetVisibility(false);
      }
    });
    borderGlowMovieStatusReactor();
    mirroredTextIndicesReactor();
    startInactivityCron();
  }

  @observable
  Cron currentCron = Cron();

  @action
  startInactivityCron() {
    currentCron.close();
    currentCron = Cron();
    currentCron.schedule(Schedule.parse('*/1 * * * *'), () {
      print("arey ou running when u not supposed to");
      borderGlow.initWhiteOut();
      textEditor.setWidgetVisibility(false);
      canTap = true;
      canSwipeUp = false;
    });
  }

  @action
  stopInactivityCron() {
    currentCron.close();
  }

  @observable
  int inactivityCount = 0;

  borderGlowMovieStatusReactor() =>
      reaction((p0) => borderGlow.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (borderGlow.isGlowingUp) {
            canTap = true;
            canSwipeUp = false;
            mirroredText.startBothRotatingText(
                isResuming: inactivityCount != 0);
            textEditor.setWidgetVisibility(false);
          } else {
            textEditor.setWidgetVisibility(true);
            canTap = false;
            inactivityCount++;
            startInactivityCron();
            borderGlow.setAltControl(Control.stop);
          }
        }
      });

  mirroredTextIndicesReactor() =>
      reaction((p0) => mirroredText.isReadyToBeDismissed, (p0) {
        if (p0) {
          borderGlow.initGlowDown();
        }
      });

  onTap(Offset position) {
    if (canTap) {
      if (touchRipple.tapPlacement == TapPlacement.topHalf) {
        if (mirroredText.primaryRightSideUpCurrentMessage.isNotEmpty) {
          mirroredText.startRotatingRightSideUp(isResuming: true);
        }
      } else {
        if (mirroredText.primaryUpsideDownCurrentMessage.isNotEmpty) {
          mirroredText.startRotatingUpsideDown(isResuming: true);
        }
      }
      touchRipple.onTap(position, overridedColor: Colors.black);
    }
  }

  @action
  onSwipeUp(Function(String) onSwipeUp) async {
    if (canSwipeUp) {
      stopInactivityCron();
      if (textEditor.controller.text.isNotEmpty) {
        await onSwipeUp(textEditor.controller.text);
        setCanSwipeUp(false);
        smartText.setWidgetVisibility(false);
        textEditor.setWidgetVisibility(false);
        Timer(Seconds.get(1), () {
          textEditor.controller.clear();
          textEditor.setWidgetVisibility(true);
          setCanSwipeUp(true);
        });
      }
    }
  }

  @action
  onExit() {
    stopInactivityCron();
    textEditor.setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      Modular.to.navigate("/irl_nokhte_session/exit");
    });
  }

  @action
  onCollaboratorLeft() {
    stopInactivityCron();
    textEditor.setWidgetVisibility(false);
    smartText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    startInactivityCron();
    textEditor.setWidgetVisibility(true);
    smartText.setWidgetVisibility(smartText.pastShowWidget);
  }
}
