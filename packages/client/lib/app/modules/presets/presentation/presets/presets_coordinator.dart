// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides
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

abstract class _PresetsCoordinatorBase with Store, BaseCoordinator, Disposer {
  final PresetsWidgetsCoordinator widgets;
  final PresetsLogicCoordinator logic;
  final SwipeDetector swipe;
  final UserInformationCoordinator userInformation;
  final TapDetector tap;
  final CaptureScreen captureScreen;

  _PresetsCoordinatorBase({
    required this.widgets,
    required this.captureScreen,
    required this.logic,
    required this.swipe,
    required this.tap,
    required this.userInformation,
  });

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await logic.getCompanyPresets();
    await userInformation.getPreferredPreset();
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
    disposers.add(preferredPresetReactor());
    disposers.add(companyPresetsReactor());
    disposers.add(
        widgets.selectionCondensedPresetCardMovieStatusReactor(onSelected));
    disposers.add(tapReactor());
    disposers.add(swipeReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
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

  @override
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}
