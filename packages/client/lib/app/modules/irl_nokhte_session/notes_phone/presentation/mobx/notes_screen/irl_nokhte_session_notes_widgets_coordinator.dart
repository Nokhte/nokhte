// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:cron/cron.dart';
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
  _IrlNokhteSessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
    required this.borderGlow,
  });

  @observable
  bool showSubmitText = false;

  @observable
  bool canSwipeUp = true;

  @observable
  bool canTap = false;

  @observable
  bool rightSideUpHasBeenDismissed = false;

  @observable
  bool upsideDownHasBeenDismissed = false;

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
  }

  initBorderGlowReactors(
      {required Function onGlowInitiated, required Function onGlowDown}) {
    borderGlowMovieStatusReactor(onGlowInitiated: onGlowInitiated);
    startInactivityCron(onGlowInitiated);
    textEditor.focusNode.addListener(() {
      if (!textEditor.focusNode.hasFocus) {
        startInactivityCron(onGlowDown);
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        } else {
          smartText.setWidgetVisibility(false);
        }
      } else {
        stopInactivityCron();
        smartText.setWidgetVisibility(false);
      }
    });
    //
  }

  @observable
  Cron currentCron = Cron();

  @action
  startInactivityCron(Function onGlowInitiated) {
    currentCron.close();
    currentCron = Cron();
    currentCron.schedule(Schedule.parse('*/3 * * * *'), () async {
      borderGlow.initWhiteOut();
      textEditor.setWidgetVisibility(false);
      textEditor.setIsReadOnly(true);
      canTap = true;
      canSwipeUp = false;
      await onGlowInitiated();
    });
  }

  @action
  stopInactivityCron() {
    currentCron.close();
  }

  @observable
  int inactivityCount = 0;

  borderGlowMovieStatusReactor({
    required Function onGlowInitiated,
  }) =>
      reaction((p0) => borderGlow.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (borderGlow.isGlowingUp) {
            canTap = true;
            canSwipeUp = false;
            Modular.to.navigate('/irl_nokhte_session/notes_inactivity');
          }
        }
      });

  @action
  onSwipeUp(Function(String) onSwipeUp, Function onGlowInitiated) async {
    if (canSwipeUp) {
      startInactivityCron(onGlowInitiated);
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
  onCollaboratorJoined(Function onGlowInitated) {
    startInactivityCron(onGlowInitated);
    textEditor.setWidgetVisibility(true);
    smartText.setWidgetVisibility(smartText.pastShowWidget);
  }
}
