// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
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
  final TouchRippleStore touchRipple;

  _IrlNokhteSessionSpeakingScreenWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.wifiDisconnectOverlay,
    required this.touchRipple,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.staticHalfAndHalf);
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingPhone,
    );
    mirroredText.startBothRotatingText();
    // static half screen movie
    // fade in the text that's the smaller bottom stuff
    // init reactors of some sort probably
  }
}