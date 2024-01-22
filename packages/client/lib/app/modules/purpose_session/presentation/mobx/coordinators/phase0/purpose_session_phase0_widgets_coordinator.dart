// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'purpose_session_phase0_widgets_coordinator.g.dart';

class PurposeSessionPhase0WidgetsCoordinator = _PurposeSessionPhase0WidgetsCoordinatorBase
    with _$PurposeSessionPhase0WidgetsCoordinator;

abstract class _PurposeSessionPhase0WidgetsCoordinatorBase
    extends BaseCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore primarySmartText;

  _PurposeSessionPhase0WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
  });

  @observable
  bool isConnected = true;

  @action
  setIsConnected(bool newVal) => isConnected = newVal;

  @action
  onInactive() {
    if (isConnected) {
      primarySmartText.reset();
    }
  }

  @action
  onResumed() {
    if (isConnected) {
      primarySmartText.startRotatingText();
    }
  }

  @action
  constructor() {
    beachWaves
        .setMovieMode(BeachWaveMovieModes.suspendedAtTheDepthsToTimesUpStart);
    beachWaves.currentStore.initMovie(NoParams());
    primarySmartText
        .setMessagesData(MessagesData.primaryPurposeSessionPhase0List);
    primarySmartText.startRotatingText();
    initReactors();
  }

  initReactors() {
    wifiDisconnectOverlay.connectionReactor(
      onConnected: () {
        setIsConnected(true);
      },
      onDisconnected: () {
        setIsConnected(false);
      },
    );
    smartTextReactor();
    wifiDisconnectOverlayReactor();
  }

  smartTextReactor() => reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (p0 == 2) {
          Modular.to.navigate('/purpose_session/phase_one');
        }
      });

  wifiDisconnectOverlayReactor() =>
      reaction((p0) => wifiDisconnectOverlay.movieStatus, (p0) {
        if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.removeTheCircle) {
          if (p0 == MovieStatus.finished) {
            primarySmartText.resume();
          }
        } else if (wifiDisconnectOverlay.movieMode ==
            WifiDisconnectMovieModes.placeTheCircle) {
          if (p0 == MovieStatus.inProgress) {
            primarySmartText.pause();
          }
        }
      });
}
