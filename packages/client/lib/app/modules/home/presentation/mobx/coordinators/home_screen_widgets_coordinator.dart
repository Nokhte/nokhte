// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_widgets_coordinator.g.dart';

class HomeScreenWidgetsCoordinator = _HomeScreenWidgetsCoordinatorBase
    with _$HomeScreenWidgetsCoordinator;

abstract class _HomeScreenWidgetsCoordinatorBase extends Equatable with Store {
  final TimeAlignmentModelCoordinator timeModel;
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;

  _HomeScreenWidgetsCoordinatorBase({
    required this.timeModel,
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.secondarySmartText,
  });

  @action
  constructor() {
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    secondarySmartText.setMessagesData(MessagesData.firstTimeSecondaryHomeList);
    primarySmartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtOceanDive);
    initReactors();
  }

  @action
  onConnected() {
    if (isDisconnected) toggleIsDisconnected();
  }

  @action
  onDisconnected() {
    if (!isDisconnected) toggleIsDisconnected();
  }

  @action
  onResumed() {
    if (clockAnimationHasNotStarted) {
      primarySmartText.resume();
      primarySmartText.startRotatingText();
      beachWaves.currentStore.setControl(Control.mirror);
      if (hasInitiatedBlur) {
        nokhteBlur.reverse();
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onInactive() {
    if (clockAnimationHasNotStarted) {
      primarySmartText.pause();
      primarySmartText.reset();
    }
  }

  @observable
  bool clockAnimationHasNotStarted = true;

  @observable
  bool clockIsVisible = false;

  @observable
  bool isDisconnected = false;

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool secondaryTextIsInProgress = false;

  @observable
  bool isDoubleTriggeringWindDown = false;

  @action
  toggleIsDoubleTriggeringWindDown() =>
      isDoubleTriggeringWindDown = !isDoubleTriggeringWindDown;

  @action
  toggleClockIsVisible() => clockIsVisible = !clockIsVisible;

  @action
  toggleIsDisconnected() => isDisconnected = !isDisconnected;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  @action
  toggleSecondaryTextIsInProgress() =>
      secondaryTextIsInProgress = !secondaryTextIsInProgress;

  initReactors() {
    primarySmartTextReactor();
    secondarySmartTextReactor();
    gestureCrossTapReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
    clockFaceAnimationStatusReactor();
    availabilitySectorsMovieStatusReactor();
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  primarySmartTextReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 3) {
          timeModel.init();
        }
      });
  secondarySmartTextReactor() => reaction(
      (p0) => secondarySmartText.currentIndex,
      (p0) => onSecondarySmartTextTransitions(p0));

  clockFaceAnimationStatusReactor() => reaction(
      (p0) => timeModel.clockFace.movieStatus,
      (p0) => onClockFaceAnimationFinished(p0));

  availabilitySectorsMovieStatusReactor() => reaction(
      (p0) => timeModel.availabilitySectors.movieStatus,
      (p0) => onAvailabilitySectorMovieStatusFinished(p0));

  wifiDisconnectOverlayReactor() =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          if (clockAnimationHasNotStarted) {
            primarySmartText.resume();
          }
        } else if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
          if (clockAnimationHasNotStarted) {
            primarySmartText.pause();
          }
        }
      });

  @action
  onGestureCrossTap() {
    if (!isDisconnected) {
      if (!hasInitiatedBlur) {
        nokhteBlur.init();
        primarySmartText.startRotatingText(isResuming: true);
        beachWaves.currentStore.setControl(Control.stop);
        toggleHasInitiatedBlur();
      } else if (clockIsVisible && !secondaryTextIsInProgress) {
        toggleSecondaryTextIsInProgress();
        secondarySmartText.startRotatingText(isResuming: true);
      }
    }
  }

  @action
  onSecondarySmartTextTransitions(int p0) {
    if (!secondaryTextIsInProgress) {
      toggleSecondaryTextIsInProgress();
    }
    toggleSecondaryTextIsInProgress();
    if (p0 == 2) {
      secondarySmartText.reset();
      secondarySmartText.startRotatingText();
    }
  }

  @action
  onClockFaceAnimationFinished(p0) {
    if (p0 == MovieStatus.finished) {
      secondarySmartText.startRotatingText();
      toggleClockIsVisible();
    } else if (p0 == MovieStatus.inProgress) {
      clockAnimationHasNotStarted = false;
    }
  }

  @action
  onAvailabilitySectorMovieStatusFinished(MovieStatus p0) {
    if (p0 == MovieStatus.finished &&
        timeModel.availabilitySectors.pastControl == Control.playFromStart) {
      timeModel.reverseClockFaceMovie();
      secondarySmartText.setControl(Control.stop);
      beachWaves.currentStore.setControl(Control.mirror);
      secondarySmartText.toggleWidgetVisibility();
      nokhteBlur.reverse();
    }
  }

  @override
  List<Object> get props => [];
}
