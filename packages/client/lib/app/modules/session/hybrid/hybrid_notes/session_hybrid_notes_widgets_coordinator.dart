// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_hybrid_notes_widgets_coordinator.g.dart';

class SessionHybridNotesWidgetsCoordinator = _SessionHybridNotesWidgetsCoordinatorBase
    with _$SessionHybridNotesWidgetsCoordinator;

abstract class _SessionHybridNotesWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final SmartTextStore smartText;
  final BorderGlowStore borderGlow;
  _SessionHybridNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
    required this.borderGlow,
  });

  @observable
  String lastSubmittedText = '';

  @observable
  bool showSubmitText = false;

  @observable
  int inactivityCount = 0;

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
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    textEditor.initFadeIn();
    textEditor.focusNode.addListener(() {
      inactivityCount++;
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        } else {
          navigateAway();
        }
      } else {
        smartText.setWidgetVisibility(false);
      }
    });
    Timer(Seconds.get(9, milli: 500), () {
      if (inactivityCount == 0) {
        navigateAway();
      }
    });
    beachWavesMovieStatusReactor();
    setCanSwipeUp(true);
  }

  @action
  navigateAway() {
    smartText.setWidgetVisibility(false);
    textEditor.setWidgetVisibility(false);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.vibrantBlueGradToInvertedHalfAndHalf,
    );
    beachWaves.currentStore.initMovie(NoParams());

    setCanSwipeUp(false);
  }

  @action
  onSwipeUp(Function(String) onSwipeUp) async {
    if (canSwipeUp) {
      if (textEditor.controller.text.isNotEmpty &&
          textEditor.controller.text != lastSubmittedText) {
        lastSubmittedText = textEditor.controller.text;
        await onSwipeUp(textEditor.controller.text);
        navigateAway();
      }
    }
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

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.vibrantBlueGradToInvertedHalfAndHalf) {
          Modular.to.navigate('/session/hybrid/');
        }
      });
}
