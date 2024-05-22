// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'waiting_patron_widgets_coordinator.dart';
part 'waiting_patron_coordinator.g.dart';

class WaitingPatronCoordinator = _WaitingPatronCoordinatorBase
    with _$WaitingPatronCoordinator;

abstract class _WaitingPatronCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final TapDetector tap;
  final WaitingPatronWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;

  _WaitingPatronCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.swipe,
    required super.getUserInfo,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    if (sessionMetadata.isAValidSession) {
      widgets.onSessionUnlocked();
    }
    initReactors();
    await captureScreen(SessionConstants.waitingPatron);
    await getUserInfo(NoParams());
  }

  initReactors() {
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {},
      onDisconnected: () {},
    );
    widgets.beachWaveMovieStatusReactor(onReturnHome: onAnimationComplete);
    validSessionReactor();
    phaseReactor();
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
