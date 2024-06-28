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

abstract class _SessionNotesWidgetsCoordinatorBase with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final SmartTextStore smartText;

  final BaseWidgetsCoordinator base;

  _SessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required WifiDisconnectOverlayStore wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
  }) : base = BaseWidgetsCoordinator(
            wifiDisconnectOverlay: wifiDisconnectOverlay);

  @observable
  String lastSubmittedText = '';

  @observable
  bool showSubmitText = false;

  @observable
  bool canSwipeUp = true;

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
    textEditor.focusNode.addListener(() {
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        }
      } else {
        smartText.setWidgetVisibility(false);
      }
    });
  }

  @action
  onSwipeUp(Function(String) onSwipeUp) async {
    if (canSwipeUp) {
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
  onCollaboratorJoined() {
    textEditor.setWidgetVisibility(true);
    smartText.setWidgetVisibility(smartText.pastShowWidget);
  }
}