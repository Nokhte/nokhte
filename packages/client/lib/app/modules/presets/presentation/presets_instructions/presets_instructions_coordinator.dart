// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
part 'presets_instructions_coordinator.g.dart';

class PresetsInstructionsCoordinator = _PresetsInstructionsCoordinatorBase
    with _$PresetsInstructionsCoordinator;

abstract class _PresetsInstructionsCoordinatorBase extends BaseCoordinator
    with Store {
  final PresetsInstructionsWidgetsCoordinator widgets;
  final PresetsLogicCoordinator logic;
  final TapDetector tap;

  _PresetsInstructionsCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.logic,
    required this.tap,
  });

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await logic.getCompanyPresets();
    await captureScreen(PresetsConstants.presetsInstructions);
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
    disposers.add(companyPresetsReactor());
    disposers.add(tapReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.dismissExpandedPresetCard();
        });
      });

  companyPresetsReactor() => reaction((p0) => logic.names, (p0) {
        widgets.onCompanyPresetsReceived(
          unifiedUIDs: logic.unifiedUIDs,
          names: logic.names,
          tags: logic.tags,
        );
      });

  @override
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}
