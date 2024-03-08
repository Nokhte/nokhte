// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'irl_nokhte_session_speaking_screen_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingScreenWidgetsCoordinator = _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingScreenWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;

  _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.speakLessSmileMore,
  });

  @observable
  bool letGoIsTriggered = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingPhone,
    );
    mirroredText.startBothRotatingText();
    initReactors();
  }

  @action
  initReactors() {
    beachWavesMovieStatusReactor();
    borderGlowReactor();
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.halfAndHalfToDrySand &&
            beachWaves.currentStore.control == Control.playFromStart) {
          beachWaves.setMovieMode(BeachWaveMovieModes.drySandToVibrantBlueGrad);
          beachWaves.currentStore.initMovie(NoParams());
        } else if (p0 == MovieStatus.finished &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.drySandToVibrantBlueGrad &&
            beachWaves.currentStore.control == Control.playFromStart) {
          borderGlow.initMovie(NoParams());
        }
      });

  borderGlowReactor() => reaction((p0) => borderGlow.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && borderGlow.isGlowingUp) {
          speakLessSmileMore.setSpeakLess(true);
          Future.delayed(Seconds.get(2), () {
            if (!letGoIsTriggered) {
              speakLessSmileMore.setSmileMore(true);
            }
          });
        }
      });

  @action
  onHold() {
    letGoIsTriggered = false;
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    beachWaves.currentStore.initMovie(NoParams());
    mirroredText.setWidgetVisibility(false);
  }

  @action
  onLetGo() {
    letGoIsTriggered = true;
    borderGlow.initGlowDown();
    beachWaves.setMovieMode(BeachWaveMovieModes.dynamicPointToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
    speakLessSmileMore.hideBoth();
    mirroredText.setWidgetVisibility(true);
  }
}
