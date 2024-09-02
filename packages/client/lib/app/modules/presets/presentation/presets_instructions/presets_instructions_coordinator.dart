// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
part 'presets_instructions_coordinator.g.dart';

class PresetsInstructionsCoordinator = _PresetsInstructionsCoordinatorBase
    with _$PresetsInstructionsCoordinator;

abstract class _PresetsInstructionsCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final PresetsInstructionsWidgetsCoordinator widgets;
  final PresetsLogicCoordinator logic;
  final TapDetector tap;
  final UserInformationCoordinator userInformation;
  final GetUserInfoStore getUserInfo;

  @override
  final CaptureScreen captureScreen;

  _PresetsInstructionsCoordinatorBase({
    required this.widgets,
    required this.captureScreen,
    required this.logic,
    required this.tap,
    required this.userInformation,
  }) : getUserInfo = userInformation.getUserInfoStore {
    initBaseCoordinatorActions();
  }

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await logic.getCompanyPresets();
    await getUserInfo(NoParams());
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
    disposers.add(
        widgets.selectionCondensedPresetCardMovieStatusReactor(onSelected));
  }

  @action
  onSelected(String presetUID) async {
    await userInformation.updatePreferredPreset(presetUID);
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
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
    widgets.dispose();
    dispose();
  }
}
