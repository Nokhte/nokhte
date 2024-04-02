// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_notes_widgets_coordinator.g.dart';

class IrlNokhteSessionNotesWidgetsCoordinator = _IrlNokhteSessionNotesWidgetsCoordinatorBase
    with _$IrlNokhteSessionNotesWidgetsCoordinator;

abstract class _IrlNokhteSessionNotesWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final SmartTextStore smartText;
  _IrlNokhteSessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
  });

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
    smartText.setMessagesData(MessagesData.notesSessionPrimaryList);
    smartText.setWidgetVisibility(false);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    textEditor.initFadeIn();
    textEditor.focusNode.addListener(() {
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
  onSwipeUp(Function(String) onSwipeUp) async {
    if (canSwipeUp) {
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
    textEditor.setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      Modular.to.navigate("/irl_nokhte_session/exit");
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
