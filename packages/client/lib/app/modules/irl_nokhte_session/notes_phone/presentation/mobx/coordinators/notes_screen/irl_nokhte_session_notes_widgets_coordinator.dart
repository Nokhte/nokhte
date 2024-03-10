// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_notes_widgets_coordinator.g.dart';

class IrlNokhteSessionNotesWidgetsCoordinator = _IrlNokhteSessionNotesWidgetsCoordinatorBase
    with _$IrlNokhteSessionNotesWidgetsCoordinator;

abstract class _IrlNokhteSessionNotesWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final MirroredTextStore mirroredText;
  // final TheStonesThrow stonesThrow;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _IrlNokhteSessionNotesWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.mirroredText,
    required this.wifiDisconnectOverlay,
    // required this.stonesThrow,
  });

  @action
  constructor() {
    //
  }
}
