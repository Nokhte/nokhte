// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'collaborator_pool_screen_widgets_coordinator.g.dart';

class CollaboratorPoolScreenWidgetsCoordinator = _CollaboratorPoolScreenWidgetsCoordinatorBase
    with _$CollaboratorPoolScreenWidgetsCoordinator;

abstract class _CollaboratorPoolScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final GestureCrossStore gestureCross;
  final BeachWavesStore beachWaves;
  final WaitingTextStore waitingText;

  _CollaboratorPoolScreenWidgetsCoordinatorBase({
    required this.gestureCross,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.waitingText,
  });

  @observable
  bool isTransitioningToNokhteSession = false;

  final timerDuration = Seconds.get(63);
  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
    waitingText.setAltMovie(timerDuration);
    waitingText.toggleWidgetVisibility();
    beachWaves.currentStore.initMovie(NoParams());
    initReactors();
    Timer(Seconds.get(0, milli: 100), () {
      waitingText.toggleWidgetVisibility();
    });
  }

  initReactors() {
    wifiDisconnectOverlayReactor();
    beachWavesMovieStatusReactor();
    wifiDisconnectOverlay.initReactors(
        onQuickConnected: () => null,
        onDisconnected: onDisconnected,
        onLongReConnected: onConnected);
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.vibrantBlueGradientToTimesUp) {
            beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
            beachWaves.currentStore.initMovie(timerDuration);
            waitingText.setAltControl(Control.play);
            waitingText.setControl(Control.loop);
          } else if (beachWaves.movieMode == BeachWaveMovieModes.timesUp &&
              beachWaves.currentControl != Control.stop) {
            beachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToOceanDive);
            waitingText.toggleWidgetVisibility();
            gestureCross.fadeInTheCross();
            beachWaves.currentStore.initMovie(NoParams());
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.timesUpDynamicPointToTheDepths) {
            Modular.to.navigate("/irl_nokhte_session/");
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.timesUpEndToOceanDive) {
            Modular.to.navigate("/collaboration/");
          }
        }
      });

  @action
  onInactive() {
    if (beachWaves.currentControl == Control.playFromStart) {
      beachWaves.currentStore.setControl(Control.stop);
      beachWaves.currentStore.setControl(Control.play);
    }
  }

  @action
  initTransition({bool isNokhteSession = false}) {
    isTransitioningToNokhteSession = isNokhteSession;
    waitingText.toggleWidgetVisibility();
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUpDynamicPointToTheDepths);
    beachWaves.currentStore.initMovie([
      ColorAndStop(beachWaves.currentAnimationValues[1],
          beachWaves.currentAnimationValues[9]),
      ColorAndStop(beachWaves.currentAnimationValues[2],
          beachWaves.currentAnimationValues[10]),
      ColorAndStop(beachWaves.currentAnimationValues[3],
          beachWaves.currentAnimationValues[11]),
      ColorAndStop(beachWaves.currentAnimationValues[4],
          beachWaves.currentAnimationValues[12]),
      ColorAndStop(beachWaves.currentAnimationValues[5],
          beachWaves.currentAnimationValues[13]),
      ColorAndStop(beachWaves.currentAnimationValues[6],
          beachWaves.currentAnimationValues[14]),
      ColorAndStop(beachWaves.currentAnimationValues[7],
          beachWaves.currentAnimationValues[15]),
      ColorAndStop(beachWaves.currentAnimationValues[8],
          beachWaves.currentAnimationValues[16]),
    ]);
  }

  @action
  onConnected() {
    if (wifiDisconnectOverlay.movieMode ==
        WifiDisconnectMovieModes.placeTheCircle) {
      beachWaves.currentStore.setControl(Control.play);
      setIsDisconnected(false);
    }
  }

  @action
  onDisconnected() {
    setIsDisconnected(true);
    if (beachWaves.currentControl == Control.playFromStart) {
      beachWaves.currentStore.setControl(Control.stop);
    }
  }

  wifiDisconnectOverlayReactor() =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          setIsDisconnected(false);
          if (beachWaves.currentControl == Control.stop) {
            beachWaves.currentStore.setControl(Control.play);
          }
        }
      });
}
