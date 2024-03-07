// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_speaking_screen_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingScreenWidgetsCoordinator = _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingScreenWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.wifiDisconnectOverlay,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingPhone,
    );
    initReactors();
  }

  @action
  initReactors() {
    beachWavesMovieStatusReactor();
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf) {
          mirroredText.startRotatingText(
            orientation: MirroredTextOrientations.rightSideUp,
          );
        }
      });
}
