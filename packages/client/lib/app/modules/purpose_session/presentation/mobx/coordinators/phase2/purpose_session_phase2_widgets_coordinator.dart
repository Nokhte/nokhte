// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/smart_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'purpose_session_phase2_widgets_coordinator.g.dart';

class PurposeSessionPhase2WidgetsCoordinator = _PurposeSessionPhase2WidgetsCoordinatorBase
    with _$PurposeSessionPhase2WidgetsCoordinator;

abstract class _PurposeSessionPhase2WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;

  _PurposeSessionPhase2WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.primarySmartText,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
  });

  @action
  constructor() {
    beachWaves
        .setMovieMode(BeachWaveMovieModes.suspendedAtTheDepthsToTimesUpStart);
    beachWaves.currentStore.initMovie(NoParams());
    primarySmartText.setMessagesData(MessagesData.purposeSessionPhase2List);
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  initReactors() {
    smartTextIndexReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: () {},
      onDisconnected: () {},
    );
  }

  smartTextIndexReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 1) {
          // show document
        }
      });
}
