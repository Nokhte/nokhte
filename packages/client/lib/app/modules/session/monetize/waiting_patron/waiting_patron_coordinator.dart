// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'waiting_patron_widgets_coordinator.dart';
part 'waiting_patron_coordinator.g.dart';

class WaitingPatronCoordinator = _WaitingPatronCoordinatorBase
    with _$WaitingPatronCoordinator;

abstract class _WaitingPatronCoordinatorBase with Store, HomeScreenRouter {
  final TapDetector tap;
  final WaitingPatronWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  @override
  final GetUserInfoStore getUserInfo;
  final BaseCoordinator base;

  _WaitingPatronCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.swipe,
    required this.getUserInfo,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() async {
    widgets.constructor();
    if (sessionMetadata.isAValidSession) {
      widgets.onSessionUnlocked();
    }
    initReactors();
    await base.captureScreen(SessionConstants.waitingPatron);
    await getUserInfo(NoParams());
  }

  initReactors() {
    base.disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {},
      onDisconnected: () {},
    ));
    base.disposers.add(
        widgets.beachWaveMovieStatusReactor(onReturnHome: onAnimationComplete));
    base.disposers.add(validSessionReactor());
    base.disposers.add(phaseReactor());
  }

  phaseReactor() => reaction((p0) => sessionMetadata.currentPhases, (p0) async {
        if (p0.contains(-1)) {
          await sessionMetadata.dispose();
          widgets.onExit();
        }
      });

  validSessionReactor() =>
      reaction((p0) => sessionMetadata.isAValidSession, (p0) {
        if (p0) {
          widgets.onSessionUnlocked();
        }
      });

  @action
  onInactive() async {}

  @action
  onResumed() async {}
}
