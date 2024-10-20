// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'session_starter_coordinator.g.dart';

class SessionStarterCoordinator = _SessionStarterCoordinatorBase
    with _$SessionStarterCoordinator;

abstract class _SessionStarterCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionStarterWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  final SessionStartersLogicCoordinator starterLogic;
  final PresetsLogicCoordinator presetsLogic;
  final UserInformationCoordinator userInfo;
  @override
  final CaptureScreen captureScreen;

  _SessionStarterCoordinatorBase({
    required this.widgets,
    required this.userInfo,
    required this.tap,
    required this.swipe,
    required this.starterLogic,
    required this.presetsLogic,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

  @observable
  bool isNavigatingAway = false;

  @action
  toggleIsNavigatingAway() => isNavigatingAway = !isNavigatingAway;

  @action
  constructor() async {
    widgets.constructor();
    widgets.initReactors();
    initReactors();
    await userInfo.getPreferredPreset();
    await presetsLogic.getCompanyPresets();
    await starterLogic.initialize();
    await captureScreen(SessionStarterConstants.sessionStarter);
    starterLogic.listenToSessionActivation();
  }

  initReactors() {
    disposers.add(swipeReactor());
    disposers.add(companyPresetsReactor());
    disposers.add(preferredPresetReactor());
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
    disposers.add(nokhteSearchStatusReactor());
    disposers.add(widgets.presetSelectionReactor(onSelected));
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSelected(String presetUID) async {
    await userInfo.updatePreferredPreset(presetUID);
    await userInfo.getPreferredPreset();
    await starterLogic.nuke();
    await starterLogic.initialize();
  }

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeDown(() async {
              toggleIsNavigatingAway();
              await starterLogic.dispose(shouldNuke: true);
            });
          });
        default:
          break;
      }
    }
  }

  nokhteSearchStatusReactor() =>
      reaction((p0) => starterLogic.hasFoundNokhteSession, (p0) async {
        if (p0) {
          setDisableAllTouchFeedback(true);
          await starterLogic.dispose();
          widgets.initTransition();
        }
      });

  preferredPresetReactor() => reaction((p0) => userInfo.preferredPreset, (p0) {
        if (userInfo.hasAccessedQrCode) {
          widgets.onPreferredPresetReceived(
            sessionName: p0.name,
            tags: p0.tags,
            presetUID: userInfo.preferredPreset.presetUID,
            userUID: userInfo.preferredPreset.userUID,
          );
        } else {
          widgets.onNoPresetSelected();
        }
      });

  companyPresetsReactor() => reaction((p0) => presetsLogic.names, (p0) {
        widgets.onCompanyPresetsReceived(
          uids: presetsLogic.uids,
          names: presetsLogic.names,
          tags: presetsLogic.tags,
        );
        if (!userInfo.hasAccessedQrCode) {
          widgets.presetCards.enableAllTouchFeedback();
        }
      });

  deconstructor() {
    starterLogic.dispose();
    dispose();
    widgets.dispose();
  }
}
