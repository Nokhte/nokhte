// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/smart_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'legacy_virtual_nokhte_session_phase1_widgets_coordinator.g.dart';

class LegacyVirtualNokhteSessionPhase1WidgetsCoordinator = _LegacyVirtualNokhteSessionPhase1WidgetsCoordinatorBase
    with _$LegacyVirtualNokhteSessionPhase1WidgetsCoordinator;

abstract class _LegacyVirtualNokhteSessionPhase1WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final SmartTextStore secondarySmartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final TextEditorStore textEditor;
  final GestureCrossStore gestureCross;
  final WaitingTextStore waitingText;
  final NokhteBlurStore blur;

  _LegacyVirtualNokhteSessionPhase1WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.borderGlow,
    required this.secondarySmartText,
    required this.wifiDisconnectOverlay,
    required this.textEditor,
    required this.gestureCross,
    required this.waitingText,
    required this.blur,
  });

  @observable
  bool hasTheQuestion = false;

  @observable
  bool isTransitioningHome = false;

  @action
  setHasTheQuesion(bool newVal) => hasTheQuestion = newVal;

  @observable
  bool isInTheCall = false;

  @action
  constructor() {
    gestureCross.setHomeScreen();
    gestureCross.fadeAllOut();
    waitingText.setAltMovie(Seconds.get(1000));
    waitingText.toggleWidgetVisibility();
    Future.delayed(Seconds.get(1), () {
      gestureCross.fadeAllIn();
    });
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
    secondarySmartText.setMessagesData(MessagesData.empty);
    initReactors();
  }

  @action
  initReactors() {
    wifiDisconnectOverlay.initReactors(
      onQuickConnected: () {
        setIsDisconnected(false);
      },
      onLongReConnected: () {
        setIsDisconnected(false);
      },
      onDisconnected: () {
        setIsDisconnected(true);
      },
    );
    centerNokhteReactor();
    gradientNokhteOpacityReactor();
  }

  @action
  onConnected() {
    setIsDisconnected(false);
  }

  @action
  onDisconnected() {
    setIsDisconnected(true);
  }

  @action
  onHold() {
    borderGlow.initMovie(NoParams());
  }

  @action
  onLetGo() {
    borderGlow.initGlowDown();
  }

  @action
  onInactive() {
    borderGlow.initGlowDown();
  }

  @action
  hasTheQuestionConstructor() {
    showSecondaryText();
  }

  @action
  showSecondaryText() {
    if (!secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }

    secondarySmartText.setMessagesData(
      MessagesData.secondaryPurposeSessionPhase1List,
    );
    secondarySmartText.startRotatingText();
  }

  @action
  hideSecondaryText() {
    if (secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
  }

  @action
  initTransitionToWaiting() {
    gestureCross.initMoveAndRegenerate(CircleOffsets.top);
    secondarySmartText.setWidgetVisibility(false);
  }

  @action
  revertWaitingWidgets() {
    waitingText.setControl(Control.stop);
    waitingText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(true);
    blur.reverse();
  }

  @action
  initTransitionToHome() {
    isTransitioningHome = true;
    blur.reverse();
    waitingText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    gestureCross.transitionFromNokhteSessionToHomeScreen();
    beachWaves.setMovieMode(
      BeachWaveMovieModes.onShoreToVibrantBlue,
    );
    beachWaves.currentStore.reverseMovie(NoParams());
    beachWaves.finishedCount = 1;
  }

  centerNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  gradientNokhteOpacityReactor() =>
      reaction((p0) => gestureCross.gradientNokhte.hasFadedIn, (p0) {
        if (!p0) {
          Modular.to.navigate("/nokhte_session/phase_two");
        }
      });

  wifiDisconnectOverlayReactor({required Function onConnectionFinished}) =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          setIsDisconnected(false);
          onConnectionFinished();
        }
      });
}
