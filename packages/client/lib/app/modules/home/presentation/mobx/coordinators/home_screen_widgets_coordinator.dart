// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
    primarySmartText.reset();
    if (!primarySmartText.showWidget) primarySmartText.toggleWidgetVisibility();
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    secondarySmartText.setMessagesData(MessagesData.firstTimeSecondaryHomeList);
    primarySmartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
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

  @observable
  bool clockIsVisible = false;

  @observable
  bool isDisconnected = false;

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool secondaryTextIsInProgress = false;

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
  }

  gestureCrossTapReactor() => reaction((p0) => gestureCross.tapCount, (p0) {
        if (!isDisconnected) {
          if (!hasInitiatedBlur) {
            nokhteBlur.init();
            primarySmartText.startRotatingText(isResuming: true);
            toggleHasInitiatedBlur();
          } else if (clockIsVisible && !secondaryTextIsInProgress) {
            toggleSecondaryTextIsInProgress();
            secondarySmartText.startRotatingText(isResuming: true);
          }
        }
      });

  primarySmartTextReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 3) {
          timeModel.init();
        }
      });
  secondarySmartTextReactor() =>
      reaction((p0) => secondarySmartText.currentIndex, (p0) {
        if (!secondaryTextIsInProgress) {
          toggleSecondaryTextIsInProgress();
        }
        toggleSecondaryTextIsInProgress();
        if (p0 == 2) {
          secondarySmartText.reset();
          secondarySmartText.startRotatingText();
        }
      });

  clockFaceAnimationStatusReactor() =>
      reaction((p0) => timeModel.clockFace.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          secondarySmartText.startRotatingText();
          toggleClockIsVisible();
        }
      });

  @override
  List<Object> get props => [];
}
