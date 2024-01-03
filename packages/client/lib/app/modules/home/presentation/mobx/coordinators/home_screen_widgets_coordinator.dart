// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
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
    primarySmartText.setMessagesData(MessagesData.empty);
    secondarySmartText.setMessagesData(MessagesData.empty);
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
  }

  @action
  invitationFlowConstructor() {
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    secondarySmartText.setMessagesData(MessagesData.firstTimeSecondaryHomeList);
    primarySmartText.startRotatingText();
  }

  @action
  postInvitationFlowConstuctor() {
    primarySmartText.setMessagesData(MessagesData.postInvitationFlowText);
    primarySmartText.startRotatingText();
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

  @action
  onSwipeUp() {
    if (primarySmartText.currentIndex.equals(4) && !hasSwipedUp) {
      toggleHasSwipedUp();
      nokhteBlur.reverse();
      primarySmartText.startRotatingText(isResuming: true);
      beachWaves.currentStore.setControl(Control.mirror);
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDiveSetup);
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
  bool isDoubleTriggeringWindDown = false;

  @observable
  bool hasSwipedUp = false;

  @action
  toggleHasSwipedUp() => hasSwipedUp = !hasSwipedUp;

  @action
  toggleIsDoubleTriggeringWindDown() =>
      isDoubleTriggeringWindDown = !isDoubleTriggeringWindDown;

  @action
  toggleClockIsVisible() => clockIsVisible = !clockIsVisible;

  @action
  toggleIsDisconnected() => isDisconnected = !isDisconnected;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors({
    required Function onGradientTreeNodeTap,
    required Function onInvitationFlowFinished,
  }) {
    primarySmartTextReactor(onInvitationFlowFinished);
    gestureCrossTapReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
    clockFaceAnimationStatusReactor();
    availabilitySectorsMovieStatusReactor();
    beachWavesMovieStatusReactor();
    nokhteBlurReactor();
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  primarySmartTextReactor(Function onInvitationFlowFinished) =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 3) {
          timeModel.init();
        }
        if (p0 == 4) {
          onInvitationFlowFinished();
        }
      });

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

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (beachWaves.movieStatus == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
          // modular.to.navigate('/collaboration/');
        }
      });

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

  @action
  onGestureCrossTap() {
    if (!isDisconnected) {
      if (!hasInitiatedBlur) {
        nokhteBlur.init();
        primarySmartText.startRotatingText(isResuming: true);
        beachWaves.currentStore.setControl(Control.stop);
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onClockFaceAnimationFinished(p0) {
    if (p0 == MovieStatus.finished) {
      if (timeModel.clockFace.pastControl == Control.playReverseFromEnd) {
        primarySmartText.startRotatingText(isResuming: true);
      } else {
        secondarySmartText.startRotatingText();
        toggleClockIsVisible();
      }
    } else if (p0 == MovieStatus.inProgress) {
      clockAnimationHasNotStarted = false;
    }
  }

  @action
  onAvailabilitySectorMovieStatusFinished(MovieStatus p0) {
    if (p0 == MovieStatus.finished &&
        timeModel.availabilitySectors.pastControl == Control.playFromStart) {
      timeModel.reverseClockFaceMovie();
      secondarySmartText.toggleWidgetVisibility();
    }
  }

  @override
  List<Object> get props => [];
}
