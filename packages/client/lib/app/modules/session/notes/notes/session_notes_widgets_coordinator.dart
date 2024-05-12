// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
part 'session_notes_widgets_coordinator.g.dart';

class SessionNotesWidgetsCoordinator = _SessionNotesWidgetsCoordinatorBase
    with _$SessionNotesWidgetsCoordinator;

abstract class _SessionNotesWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final SmartTextStore smartText;
  _SessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
  });

  @observable
  String lastSubmittedText = '';

  @observable
  bool showSubmitText = false;

  @observable
  bool canSwipeUp = true;

  @observable
  int activityCount = 0;

  @observable
  int baseComparisonActivityCount = 0;

  @observable
  Timer inActivityCron = Timer(Duration.zero, () {});

  @observable
  int inactivityCount = 0;

  @action
  setCanSwipeUp(bool newVal) => canSwipeUp = newVal;

  @action
  setShowSubmitText(bool newVal) => showSubmitText = newVal;

  @action
  constructor() {
    smartText.setMessagesData(SessionLists.notesPrimary);
    smartText.setWidgetVisibility(false);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    textEditor.initFadeIn();
  }

  initBorderGlowReactors(
      {required Function onGlowInitiated, required Function onGlowDown}) {
    textEditor.focusNode.addListener(() {
      inactivityCount++;
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        } else {
          smartText.setWidgetVisibility(false);
        }
      } else {
        smartText.setWidgetVisibility(false);
      }
    });
  }

  @action
  onSwipeUp(Function(String) onSwipeUp, Function onGlowInitiated) async {
    if (canSwipeUp) {
      inactivityCount++;
      if (textEditor.controller.text.isNotEmpty &&
          textEditor.controller.text != lastSubmittedText) {
        lastSubmittedText = textEditor.controller.text;
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
    textEditor.setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      Modular.to.navigate(SessionConstants.exit);
    });
  }

  @action
  onCollaboratorLeft() {
    textEditor.setWidgetVisibility(false);
    smartText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined(Function onGlowInitated) {
    textEditor.setWidgetVisibility(true);
    smartText.setWidgetVisibility(smartText.pastShowWidget);
  }
}
