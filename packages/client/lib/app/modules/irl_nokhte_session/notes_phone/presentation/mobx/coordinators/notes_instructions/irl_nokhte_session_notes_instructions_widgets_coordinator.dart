// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_notes_instructions_widgets_coordinator.g.dart';

class IrlNokhteSessionNotesInstructionsWidgetsCoordinator = _IrlNokhteSessionNotesInstructionsWidgetsCoordinatorBase
    with _$IrlNokhteSessionNotesInstructionsWidgetsCoordinator;

abstract class _IrlNokhteSessionNotesInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final MirroredTextStore mirroredText;
  final TouchRippleStore touchRipple;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _IrlNokhteSessionNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.mirroredText,
    required this.touchRipple,
    required this.wifiDisconnectOverlay,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingInstructions,
    );
    // initReactors();
  }
}
