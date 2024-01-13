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
  final NokhteBlurStore nokhteBlur;

  _PurposeSessionPhaseOneWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.nokhteBlur,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
    nokhteBlur.init();
    primarySmartText.setMessagesData(MessagesData.purposeSessionBootUpList);
    secondarySmartText.setMessagesData(MessagesData.empty);
    primarySmartText.startRotatingText();
  }

  @action
  onCallJoined() {
    primarySmartText.startRotatingText(isResuming: true);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.startRotatingText();
  }

  smartTextIndexReactor() =>
      reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 2 &&
            primarySmartText.messagesData ==
                MessagesData.purposeSessionBootUpList) {
          nokhteBlur.reverse();
          primarySmartText.setMessagesData(
            MessagesData.primaryPurposeSessionPhase1List,
          );
          primarySmartText.startRotatingText();
        }
      });
}
