// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_exit_widgets_coordinator.g.dart';

class SessionExitWidgetsCoordinator = _SessionExitWidgetsCoordinatorBase
    with _$SessionExitWidgetsCoordinator;

abstract class _SessionExitWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final SmartTextStore tertiarySmartText;
  final GestureCrossStore gestureCross;

  _SessionExitWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.tertiarySmartText,
    required this.gestureCross,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.vibrantBlueGradientToTimesUp,
    );
    primarySmartText.setMessagesData(SessionLists.exitTopText);
    secondarySmartText.setMessagesData(SessionLists.exitBottomText);
    tertiarySmartText.setMessagesData(SessionLists.exitWaiting);
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
  }

  @action
  onReadyToGoHome() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.reverseMovie(NoParams());
    tertiarySmartText.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
  }

  @action
  onSwipeUp() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    if (tertiarySmartText.currentIndex == 0) {
      tertiarySmartText.startRotatingText();
    } else {
      tertiarySmartText.setWidgetVisibility(true);
    }
  }

  @action
  onReadyToGoBack(SessionPhoneRole phoneRole) {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    tertiarySmartText.setWidgetVisibility(false);
    if (phoneRole == SessionPhoneRole.talking) {
      beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    } else if (phoneRole == SessionPhoneRole.notes) {
      Timer(Seconds.get(1), () {
        Modular.to.navigate('/session/notes');
      });
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

  @action
  onNineSecondsLapsed() {
    primarySmartText.setWidgetVisibility(true);
    secondarySmartText.setWidgetVisibility(true);
    tertiarySmartText.setWidgetVisibility(false);
  }

  beachWavesMovieStatusReactor({
    required Function onToHomeComplete,
    required Function onReturnToTalkingComplete,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
          onToHomeComplete();
        } else if (p0 == MovieStatus.finished &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf) {
          onReturnToTalkingComplete();
        }
      });
}