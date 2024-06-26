// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
part 'presets_instructions_coordinator.g.dart';

class PresetsInstructionsCoordinator = _PresetsInstructionsCoordinatorBase
    with _$PresetsInstructionsCoordinator;

abstract class _PresetsInstructionsCoordinatorBase with Store {
  final BaseCoordinator base;

  final PresetsInstructionsWidgetsCoordinator widgets;
  final PresetsLogicCoordinator logic;
  final TapDetector tap;
  final SwipeDetector swipe;
  final UserInformationCoordinator userInformation;

  _PresetsInstructionsCoordinatorBase({
    required this.widgets,
    required CaptureScreen captureScreen,
    required this.logic,
    required this.tap,
    required this.swipe,
    required this.userInformation,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await logic.getCompanyPresets();
    await base.captureScreen(PresetsConstants.presetsInstructions);
  }

  initReactors() {
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        base.setDisableAllTouchFeedback(false);
        widgets.base.setIsDisconnected(false);
      },
      onDisconnected: () {
        base.setDisableAllTouchFeedback(true);
        widgets.base.setIsDisconnected(true);
      },
    ));
    base.disposers.add(companyPresetsReactor());
    base.disposers.add(tapReactor());
    base.disposers.add(swipeReactor());
    base.disposers.add(
        widgets.selectionCondensedPresetCardMovieStatusReactor(onSelected));
  }

  @action
  onSelected(String presetUID) async =>
      await userInformation.updatePreferredPreset(presetUID);

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.right:
            widgets.onSwipeRight();
          default:
            break;
        }
      });

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onTap();
        });
      });

  companyPresetsReactor() => reaction((p0) => logic.names, (p0) {
        widgets.onCompanyPresetsReceived(
          unifiedUIDs: logic.unifiedUIDs,
          names: logic.names,
          tags: logic.tags,
        );
      });

  deconstructor() {
    widgets.base.deconstructor();
    base.deconstructor();
  }
}
