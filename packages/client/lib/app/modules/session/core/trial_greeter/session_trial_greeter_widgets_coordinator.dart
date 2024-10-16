// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_trial_greeter_widgets_coordinator.g.dart';

class SessionTrialGreeterWidgetsCoordinator = _SessionTrialGreeterWidgetsCoordinatorBase
    with _$SessionTrialGreeterWidgetsCoordinator;

abstract class _SessionTrialGreeterWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionTrialGreeterWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.touchRipple,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToDrySand);
    primarySmartText.setMessagesData(SessionLists.trialGreeterPrimary);
    secondarySmartText.setMessagesData(SessionLists.singleTapToConfirm);
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
  }

  @observable
  bool isFirstTap = true;

  @action
  onTap(Offset tapPosition) {
    touchRipple.onTap(tapPosition);
    if (isFirstTap) {
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.startRotatingText(isResuming: true);
      isFirstTap = false;
    }
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
    secondarySmartText.setWidgetVisibility(secondarySmartText.pastShowWidget);
  }
}
