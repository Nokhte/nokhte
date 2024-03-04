// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/presentation/mobx/coordinators/phase0/irl_nokhte_session_phase0_widgets_coordinator.dart';
part 'irl_nokhte_session_phase0_coordinator.g.dart';

class IrlNokhteSessionPhase0Coordinator = _IrlNokhteSessionPhase0CoordinatorBase
    with _$IrlNokhteSessionPhase0Coordinator;

abstract class _IrlNokhteSessionPhase0CoordinatorBase extends BaseCoordinator
    with Store {
  @observable
  bool isConnected = true;

  final IrlNokhteSessionPhase0WidgetsCoordinator widgets;
  final TapDetector tap;

  _IrlNokhteSessionPhase0CoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
  });

  @action
  setIsConnected(bool newVal) => isConnected = newVal;

  @action
  constructor() async {
    Modular.to.navigate('/nokhte_session/');
    widgets.constructor();
  }

  @action
  initReactors() {
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        // widgets.onResumed();
      },
      onDisconnected: () {
        // widgets.onInactive();
        setDisableAllTouchFeedback(true);
      },
    );
  }
}
