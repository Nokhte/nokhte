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
part 'nokhte_session_phase1_widgets_coordinator.g.dart';

class NokhteSessionPhase1WidgetsCoordinator = _NokhteSessionPhase1WidgetsCoordinatorBase
    with _$NokhteSessionPhase1WidgetsCoordinator;

abstract class _NokhteSessionPhase1WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final TextEditorStore textEditor;
  final GestureCrossStore gestureCross;
  final WaitingTextStore waitingText;
  final NokhteBlurStore blur;

  _NokhteSessionPhase1WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.borderGlow,
    required this.primarySmartText,
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
    gestureCross.toggleAll();
    waitingText.setAltMovie(Seconds.get(1000));
    waitingText.toggleWidgetVisibility();
    Future.delayed(Seconds.get(1), () {
      gestureCross.toggleAll();
    });
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
    primarySmartText.setMessagesData(MessagesData.empty);
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
    beachWavesMovieStatusReactor();
    centerNokhteReactor();
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
    // hideSecondaryText();
  }

  @action
  onInactive() {
    borderGlow.initGlowDown();
  }

  @action
  hasTheQuestionConstructor() {
    primarySmartText
        .setMessagesData(MessagesData.primaryNokhteSessionPhase1HasTheQuestion);
    showSecondaryText();
    primarySmartText.startRotatingText();
  }

  @action
  doesNotHaveTheQuestionConstructor() {
    primarySmartText.setMessagesData(
        MessagesData.primaryNokhteSessionPhase1DoesNotHaveTheQuestion);
    primarySmartText.startRotatingText();
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
  initWaitingWidgets() {
    gestureCross.initMoveAndRegenerate(CircleOffsets.top);
    blur.init();
    if (!waitingText.showWidget) {
      waitingText.toggleWidgetVisibility();
    }
    if (secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
    waitingText.initMovie(NoParams());
    waitingText.setControl(Control.play);
  }

  @action
  revertWaitingWidgets() {
    if (waitingText.showWidget) {
      waitingText.toggleWidgetVisibility();
    }
    if (!secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
    waitingText.setControl(Control.stop);
    blur.reverse();
  }

  @action
  initTransitionToHome() {
    isTransitioningHome = true;
    if (waitingText.showWidget) {
      waitingText.toggleWidgetVisibility();
    }
    if (secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
    gestureCross.transitionFromNokhteSessionToHomeScreen();
    beachWaves.setMovieMode(
      BeachWaveMovieModes.onShoreToVibrantBlue,
    );
    beachWaves.currentStore.reverseMovie(NoParams());
    beachWaves.finishedCount = 1;
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate("/home/");
        }
      });
  centerNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (isTransitioningHome) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
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
