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
part 'nokhte_session_phase2_widgets_coordinator.g.dart';

class NokhteSessionPhase2WidgetsCoordinator = _NokhteSessionPhase2WidgetsCoordinatorBase
    with _$NokhteSessionPhase2WidgetsCoordinator;

abstract class _NokhteSessionPhase2WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final WaitingTextStore waitingText;
  final NokhteBlurStore blur;

  _NokhteSessionPhase2WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.waitingText,
    required this.blur,
  });

  @observable
  bool isTransitioningHome = false;

  @action
  setIsTransitioningHome(bool newVal) => isTransitioningHome = newVal;

  @action
  constructor(Function onWidgetsSet, Function onTimeExpired) {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
    waitingText.setAltMovie(Seconds.get(1000));
    waitingText.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
    initReactors();
    Future.delayed(Seconds.get(0, milli: 1), () async {
      waitingText.setWidgetVisibility(true);
      waitingText.setControl(Control.loop);
      await onWidgetsSet();
      if (!isTransitioningHome) {
        Timer(Seconds.get(5), () async {
          await onTimeExpired();
          initTransitionBackToSession();
        });
      }
    });
  }

  @action
  initTransitionBackToSession() {
    blur.reverse();
    waitingText.setControl(Control.playReverse);
    gestureCross.fadeAllOut();
    Timer(Seconds.get(1), () {
      waitingText.setWidgetVisibility(false);
    });
  }

  @action
  initTransitionBackHome() {
    isTransitioningHome = true;
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.reverseMovie(NoParams());
    gestureCross.transitionFromNokhteSessionToHomeScreen();
    waitingText.setWidgetVisibility(false);
  }

  initReactors() {
    beachWavesMovieStatusReactor();
    waitingTextOpacityReactor();
  }

  waitingTextOpacityReactor() => reaction((p0) => waitingText.hasFadedIn, (p0) {
        if (!p0 && !isTransitioningHome) {
          Modular.to.navigate("/nokhte_session/phase_one");
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate("/home/");
        }
      });
}
