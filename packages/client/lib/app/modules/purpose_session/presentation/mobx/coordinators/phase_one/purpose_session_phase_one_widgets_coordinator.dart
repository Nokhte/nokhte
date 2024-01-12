// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'purpose_session_phase_one_widgets_coordinator.g.dart';

class PurposeSessionPhaseOneWidgetsCoordinator = _PurposeSessionPhaseOneWidgetsCoordinatorBase
    with _$PurposeSessionPhaseOneWidgetsCoordinator;

abstract class _PurposeSessionPhaseOneWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;

  _PurposeSessionPhaseOneWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
    primarySmartText
        .setMessagesData(MessagesData.primaryPurposeSessionPhase1List);
    secondarySmartText
        .setMessagesData(MessagesData.secondaryPurposeSessionPhase1List);
  }
}
