// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'nokhte_session_phase0_widgets_coordinator.g.dart';

class NokhteSessionPhase0WidgetsCoordinator = _NokhteSessionPhase0WidgetsCoordinatorBase
    with _$NokhteSessionPhase0WidgetsCoordinator;

abstract class _NokhteSessionPhase0WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore primarySmartText;

  _NokhteSessionPhase0WidgetsCoordinatorBase({
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
    primarySmartText.reset();
  }

  @action
  onResumed() {
    if (isConnected) {
      primarySmartText.startRotatingText(isResuming: true);
    }
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    primarySmartText
        .setMessagesData(MessagesData.primaryPurposeSessionPhase0List);
    primarySmartText.startRotatingText();
    initReactors();
  }

  initReactors() {
    wifiDisconnectOverlay.initReactors(onQuickConnected: () {
      setIsConnected(true);
    }, onDisconnected: () {
      setIsConnected(false);
      onInactive();
    }, onLongReConnected: () {
      setIsConnected(true);
      primarySmartText.startRotatingText();
    });
    smartTextReactor();
  }

  smartTextReactor() => reaction((p0) => primarySmartText.currentIndex, (p0) {
        if (!isConnected) {
          primarySmartText.reset();
        } else {
          if (p0 == 2) {
            Modular.to.navigate('/nokhte_session/phase_one');
          }
        }
      });
}
