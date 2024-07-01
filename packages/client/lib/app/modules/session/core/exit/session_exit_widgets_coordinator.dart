// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_exit_widgets_coordinator.g.dart';

class SessionExitWidgetsCoordinator = _SessionExitWidgetsCoordinatorBase
    with _$SessionExitWidgetsCoordinator;

abstract class _SessionExitWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, BaseExitWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final TintStore tint;
  @override
  final ExitStatusIndicatorStore exitStatusIndicator;
  @override
  final SmartTextStore primarySmartText;
  @override
  final SmartTextStore secondarySmartText;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionExitWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.exitStatusIndicator,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.gestureCross,
    required this.tint,
  }) {
    initBaseWidgetsCoordinatorActions();
    initBaseExitWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    tint.initMovie(NoParams());
    primarySmartText.setMessagesData(SessionLists.waitingToLeave);
    secondarySmartText.setMessagesData(SessionLists.exitBottomText);
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
    beachWaves.setMovieMode(
      BeachWaveMovieModes.skyToDrySand,
    );
  }

  @action
  initHomeTransition() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    tint.reverseMovie(NoParams());
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToSky);
    beachWaves.currentStore.reverseMovie(-10.0);
    gestureCross.fadeInTheCross();
  }

  @action
  onReadyToGoBack(SessionScreenTypes phoneRole) {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    if (phoneRole == SessionScreenTypes.speaking) {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    } else if (phoneRole == SessionScreenTypes.notes) {
      Timer(Seconds.get(1), () {
        Modular.to.navigate(SessionConstants.notes);
      });
    } else if (phoneRole == SessionScreenTypes.groupHybrid) {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToInvertedHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    }
  }

  sessionExitStatusCompletionReactor({
    required Function onInitialized,
    required Function onReadyToGoHome,
  }) =>
      reaction((p0) => exitStatusIndicator.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (exitStatusIndicator.movieMode == ExitStatusMovieModes.show) {
            onInitialized();
          } else if (exitStatusIndicator.movieMode ==
              ExitStatusMovieModes.complete) {
            await onReadyToGoHome();
          }
        }
      });

  beachWavesMovieStatusReactor({
    required Function onToHomeComplete,
    required Function onReturnToTalkingComplete,
    required Function onReturnToHybridComplete,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (p0 == MovieStatus.finished &&
              beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
            onToHomeComplete();
          } else if (p0 == MovieStatus.finished &&
              beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
            onReturnToTalkingComplete();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.skyToInvertedHalfAndHalf) {
            onReturnToHybridComplete();
          }
        }
      });
}
