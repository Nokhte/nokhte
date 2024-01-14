// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
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

  _PurposeSessionPhaseOneWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.errorText,
    required this.nokhteBlur,
  });

  @observable
  bool isInTheCall = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
    errorText.toggleWidgetVisibility();
    errorText.setMessagesData(MessagesData.purposeSessionBootUpList);
    primarySmartText.setMessagesData(MessagesData.empty);
    secondarySmartText.setMessagesData(MessagesData.empty);
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
  initTimer() {
    nokhteBlur.reverse();
    primarySmartText
        .setMessagesData(MessagesData.primaryPurposeSessionPhase1List);
    primarySmartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    beachWaves.currentStore.initMovie(const Duration(minutes: 5));
    secondarySmartText
        .setMessagesData(MessagesData.secondaryPurposeSessionPhase1List);
    secondarySmartText.startRotatingText();
  }

  @action
  resumeTimer() {
    beachWaves.currentStore.setControl(Control.play);
  }

  @action
  pausetimer() {
    beachWaves.currentStore.setControl(Control.play);
    beachWaves.currentStore.setControl(Control.stop);
  }

  @action
  onCollaboratorJoined() {
    if (errorText.showWidget) {
      errorText.toggleWidgetVisibility();
    }
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
      errorText.startRotatingText(isResuming: true);
    }
  }

  smartTextIndexReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 2 &&
            primarySmartText.messagesData ==
                MessagesData.purposeSessionBootUpList) {
          nokhteBlur.reverse();
          primarySmartText.setMessagesData(
            MessagesData.primaryPurposeSessionPhase1List,
          );
          primarySmartText.startRotatingText();
        }
      });
}
