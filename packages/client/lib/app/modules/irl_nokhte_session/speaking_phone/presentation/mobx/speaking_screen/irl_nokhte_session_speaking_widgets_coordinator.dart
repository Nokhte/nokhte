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
part 'irl_nokhte_session_speaking_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingWidgetsCoordinator = _IrlNokhteSessionSpeakingWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;

  _IrlNokhteSessionSpeakingWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.speakLessSmileMore,
  });

  @observable
  bool letGoIsTriggered = false;

  @observable
  bool isHolding = false;

  @observable
  bool isPickingUp = false;

  @action
  setIsHolding(bool newBool) => isHolding = newBool;

  @action
  setIsPickingUp(bool newBool) => isPickingUp = newBool;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingPhone,
    );
    mirroredText.startBothRotatingText();
    setIsPickingUp(false);
    initReactors();
  }

  @action
  initReactors() {
    borderGlowReactor();
    beachWavesMovieStatusReactor();
  }

  @observable
  bool canHold = true;

  @action
  setCanHold(bool newBool) => canHold = newBool;

  @action
  @action
  onLetGoCompleted({bool addDelay = false}) {
    Timer(Seconds.get(addDelay ? 2 : 0), () {
      letGoIsTriggered = false;
      setCanHold(true);
      mirroredText.setWidgetVisibility(true);
      holdCount++;
    });
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.halfAndHalfToDrySand) {
            beachWaves
                .setMovieMode(BeachWaveMovieModes.drySandToVibrantBlueGrad);
            beachWaves.currentStore.initMovie(NoParams());
          } else if (beachWaves.movieMode ==
                  BeachWaveMovieModes.drySandToVibrantBlueGrad &&
              beachWaves.currentStore.control == Control.playFromStart) {
            borderGlow.initMovie(NoParams());
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf) {
            if (isHolding) {
              borderGlow.initMovie(NoParams());
            } else if (isPickingUp) {
              Modular.to.navigate("/irl_nokhte_session/exit");
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.dynamicPointToHalfAndHalf) {
            onLetGoCompleted();
          }
        }
      });

  borderGlowReactor() => reaction((p0) => borderGlow.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            borderGlow.isGlowingUp &&
            isHolding &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.dynamicPointToHalfAndHalf) {
          speakLessSmileMore.setSpeakLess(true);
          Timer(Seconds.get(2), () {
            if (!letGoIsTriggered) {
              speakLessSmileMore.setSmileMore(true);
            }
          });
        }
      });

  @observable
  int holdCount = 0;

  @action
  onHold() {
    if (canHold && !letGoIsTriggered) {
      setIsHolding(true);
      beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
      beachWaves.currentStore.reverseMovie(NoParams());
      mirroredText.setWidgetVisibility(false);
      setCanHold(false);
    }
  }

  @action
  onExit() {
    setIsPickingUp(true);
    mirroredText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    beachWaves.currentStore.reverseMovie(NoParams());
  }

  @action
  onLetGo() {
    if (!canHold) {
      setIsHolding(false);
      setCanHold(true);
      letGoIsTriggered = true;
      borderGlow.initGlowDown();
      beachWaves.setMovieMode(BeachWaveMovieModes.dynamicPointToHalfAndHalf);
      beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
      speakLessSmileMore.hideBoth();
    }
  }
}
