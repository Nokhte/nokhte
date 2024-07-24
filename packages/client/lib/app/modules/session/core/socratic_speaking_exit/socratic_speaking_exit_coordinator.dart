// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'socratic_speaking_exit_coordinator.g.dart';

class SocraticSpeakingExitCoordinator = _SocraticSpeakingExitCoordinatorBase
    with _$SocraticSpeakingExitCoordinator;

abstract class _SocraticSpeakingExitCoordinatorBase
    with
        Store,
        BaseCoordinator,
        Reactions,
        SessionPresence,
        BaseExitCoordinator {
  final SocraticSpeakingExitWidgetsCoordinator widgets;
  @override
  final SwipeDetector swipe;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final SessionMetadataStore sessionMetadata;
  @override
  final CaptureScreen captureScreen;
  _SocraticSpeakingExitCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.presence,
    required this.swipe,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
    initBaseExitCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    await presence.updateCurrentPhase(3.0);
    sessionMetadata.setAffirmativePhase(3.0);
    swipe.setMinDistance(100.0);
    initReactors();
    disposers.add(
      userPhaseReactor(
        initWrapUp: () {
          widgets.initNotesTransition();
        },
      ),
    );
  }

  @action
  initReactors() {
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    ));
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));

    disposers.add(swipeReactor(onSwipeDown: () {
      widgets.initBackToSpeaking();
    }));
  }
}
