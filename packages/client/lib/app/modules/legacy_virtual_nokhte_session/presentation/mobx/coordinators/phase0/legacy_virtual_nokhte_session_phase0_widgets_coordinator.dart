// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'legacy_virtual_nokhte_session_phase0_widgets_coordinator.g.dart';

class LegacyVirtualNokhteSessionPhase0WidgetsCoordinator = _LegacyVirtualNokhteSessionPhase0WidgetsCoordinatorBase
    with _$LegacyVirtualNokhteSessionPhase0WidgetsCoordinator;

abstract class _LegacyVirtualNokhteSessionPhase0WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;

  _LegacyVirtualNokhteSessionPhase0WidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
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
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
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
          if (p0 == 1) {
            Modular.to.navigate('/nokhte_session/phase_one');
          }
        }
      });
}
