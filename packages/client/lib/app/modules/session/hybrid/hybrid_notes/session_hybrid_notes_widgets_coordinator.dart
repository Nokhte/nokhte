// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_hybrid_notes_widgets_coordinator.g.dart';

class SessionHybridNotesWidgetsCoordinator = _SessionHybridNotesWidgetsCoordinatorBase
    with _$SessionHybridNotesWidgetsCoordinator;

abstract class _SessionHybridNotesWidgetsCoordinatorBase
    with Store, Reactions, BaseWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final TextEditorStore textEditor;
  final SmartTextStore smartText;
  final BorderGlowStore borderGlow;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionHybridNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.textEditor,
    required this.smartText,
    required this.borderGlow,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @observable
  String lastSubmittedText = '';

  @observable
  bool showSubmitText = false;

  @observable
  int inactivityCount = 0;

  @observable
  bool canSwipeUp = true;

  @observable
  bool isACollaborativeSession = false;

  @action
  setIsACollaborativeSession(bool newVal) => isACollaborativeSession = newVal;

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
      inactivityCount++;
      if (!textEditor.focusNode.hasFocus) {
        if (textEditor.controller.text.length != (0)) {
          smartText.setWidgetVisibility(true);
        } else {
          navigateAway(isACollaborativeSession);
        }
      } else {
        smartText.setWidgetVisibility(false);
      }
    });
    Timer(Seconds.get(9, milli: 500), () {
      if (inactivityCount == 0) {
        navigateAway(isACollaborativeSession);
      }
    });
    disposers.add(beachWavesMovieStatusReactor());
    setCanSwipeUp(true);
  }

  @action
  navigateAway(isACollaborativeSession) {
    smartText.setWidgetVisibility(false);
    textEditor.setWidgetVisibility(false);
    final movieMode = isACollaborativeSession
        ? BeachWaveMovieModes.skyToHalfAndHalf
        : BeachWaveMovieModes.skyToInvertedHalfAndHalf;
    beachWaves.setMovieMode(movieMode);
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
        navigateAway(isACollaborativeSession);
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
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.skyToInvertedHalfAndHalf) {
            Modular.to.navigate(SessionConstants.groupHybrid);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.skyToHalfAndHalf) {
            Modular.to.navigate(SessionConstants.soloHybrid);
          }
        }
      });
}
