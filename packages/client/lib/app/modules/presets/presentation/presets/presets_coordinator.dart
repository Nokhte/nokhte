// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'presets_coordinator.g.dart';

class PresetsCoordinator = _PresetsCoordinatorBase with _$PresetsCoordinator;

abstract class _PresetsCoordinatorBase with Store {
  final PresetsWidgetsCoordinator widgets;
  final PresetsLogicCoordinator logic;
  final SwipeDetector swipe;
  final UserInformationCoordinator userInformation;
  final TapDetector tap;

  final BaseCoordinator base;

  _PresetsCoordinatorBase({
    required this.widgets,
    required CaptureScreen captureScreen,
    required this.logic,
    required this.swipe,
    required this.tap,
    required this.userInformation,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await logic.getCompanyPresets();
    await userInformation.getPreferredPreset();
    await base.captureScreen(PresetsConstants.presets);
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
    base.disposers.add(preferredPresetReactor());
    base.disposers.add(companyPresetsReactor());
    base.disposers.add(
        widgets.selectionCondensedPresetCardMovieStatusReactor(onSelected));
    base.disposers.add(tapReactor());
    base.disposers.add(swipeReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onTap();
        });
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.right:
            widgets.onSwipeRight();
          default:
            break;
        }
      });

  @action
  onSelected(String presetUID) async =>
      await userInformation.updatePreferredPreset(presetUID);

  preferredPresetReactor() =>
      reaction((p0) => userInformation.preferredPreset, (p0) {
        widgets.onPreferredPresetReceived(p0.unifiedUID);
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
