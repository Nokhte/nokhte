// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'presets_coordinator.g.dart';

class PresetsCoordinator = _PresetsCoordinatorBase with _$PresetsCoordinator;

abstract class _PresetsCoordinatorBase extends BaseCoordinator with Store {
  final PresetsWidgetsCoordinator widgets;

  _PresetsCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
  });

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await captureScreen(PresetsConstants.presets);
  }

  initReactors() {
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.setIsDisconnected(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.setIsDisconnected(true);
      },
    ));
  }

  @override
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}