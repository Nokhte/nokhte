// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
part 'purpose_session_phase_one_widgets_coordinator.g.dart';

class PurposeSessionPhaseOneWidgetsCoordinator = _PurposeSessionPhaseOneWidgetsCoordinatorBase
    with _$PurposeSessionPhaseOneWidgetsCoordinator;

abstract class _PurposeSessionPhaseOneWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final SmartTextStore errorText;
  final NokhteBlurStore nokhteBlur;
  final BorderGlowStore borderGlow;

  _PurposeSessionPhaseOneWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.errorText,
    required this.nokhteBlur,
    required this.borderGlow,
  });

  final timerLength = const Duration(minutes: 5);

  @observable
  bool hasTheQuestion = false;

  @action
  setHasTheQuesion(bool newVal) => hasTheQuestion = newVal;

  @observable
  bool isInTheCall = false;

  @action
  constructor() {
    beachWaves
        .setMovieMode(BeachWaveMovieModes.suspendedAtTheDepthsToTimesUpStart);
    beachWaves.currentStore.initMovie(NoParams());
    errorText.toggleWidgetVisibility();
    errorText.setMessagesData(MessagesData.purposeSessionBootUpList);
    primarySmartText.setMessagesData(MessagesData.empty);
    secondarySmartText.setMessagesData(MessagesData.empty);
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
  }

  @action
  onCallLeft() {
    isInTheCall = false;
    nokhteBlur.init();
    errorText.setCurrentIndex(0);
    if (!errorText.showWidget) {
      errorText.toggleWidgetVisibility();
    }
    errorText.startRotatingText();
  }

  @action
  onCallJoined() {
    isInTheCall = true;
    if (errorText.currentIndex == 0) {
      errorText.startRotatingText(isResuming: true);
    }
  }

  @action
  onConnected() {
    if (primarySmartText.isPaused &&
        wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
      if (isDisconnected) toggleIsDisconnected();
    }
  }

  @action
  onDisconnected() {
    if (!isDisconnected) toggleIsDisconnected();
  }

  @action
  showSecondaryText() {
    secondarySmartText.setMessagesData(
      MessagesData.secondaryPurposeSessionPhase1List,
    );
    secondarySmartText.startRotatingText();
  }

  @action
  onFirstCollaboratorFinishSpeaking() {
    showSecondaryText();
    primarySmartText.startRotatingText(isResuming: true);
  }

  @action
  hideSecondaryText() {
    if (secondarySmartText.showWidget) {
      secondarySmartText.toggleWidgetVisibility();
    }
  }

  @action
  initTimer() {
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    beachWaves.currentStore.initMovie(timerLength);
    primarySmartText.setAltMovie(timerLength);
    primarySmartText.setAltControl(Control.playFromStart);
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
    if (errorText.showWidget) {
      errorText.toggleWidgetVisibility();
    }
    nokhteBlur.reverse();
  }

  @action
  hasTheQuestionConstructor() {
    primarySmartText
        .setMessagesData(MessagesData.primaryPurposeSessionHasTheQuestion);
    showSecondaryText();
    primarySmartText.startRotatingText();
  }

  @action
  doesNotHaveTheQuestionConstructor() {
    primarySmartText.setMessagesData(
        MessagesData.primaryPurposeSessionDoesNotHaveTheQuestion);
    primarySmartText.startRotatingText();
  }

  @action
  onFirstTimeUsersAreInSync() {
    nokhteBlur.reverse();
  }

  @action
  onHold() {
    borderGlow.initMovie(NoParams());
  }

  @action
  onLetGo() {
    borderGlow.initGlowDown();
    hideSecondaryText();
  }

  @action
  onCollaboratorLeft() {
    if (isInTheCall) {
      nokhteBlur.init();
      if (errorText.currentIndex == 0) {
        errorText.setCurrentIndex(1);
      }
      if (!errorText.showWidget) {
        errorText.toggleWidgetVisibility();
      }
      errorText.startRotatingText();
    } else {
      // nokhteBlur.init();
      errorText.startRotatingText(isResuming: true);
    }
  }

  wifiDisconnectOverlayReactor({required Function onConnectionFinished}) =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          if (isDisconnected) toggleIsDisconnected();
        }
      });
}
