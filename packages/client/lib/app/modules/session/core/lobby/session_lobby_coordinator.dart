// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_metadata/user_metadata.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_lobby_coordinator.g.dart';

class SessionLobbyCoordinator = _SessionLobbyCoordinatorBase
    with _$SessionLobbyCoordinator;

abstract class _SessionLobbyCoordinatorBase
    with
        Store,
        RoutingArgs,
        ChooseGreeterType,
        BaseCoordinator,
        Reactions,
        SessionPresence {
  final SessionLobbyWidgetsCoordinator widgets;
  final TapDetector tap;
  final UserMetadataCoordinator userMetadata;
  final ActiveMonetizationSessionCoordinator activeMonetizationSession;
  final CaptureNokhteSessionStart captureStart;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final SessionMetadataStore sessionMetadata;
  @override
  final CaptureScreen captureScreen;

  _SessionLobbyCoordinatorBase({
    required this.widgets,
    required this.captureStart,
    required this.tap,
    required this.presence,
    required this.userMetadata,
    required this.activeMonetizationSession,
    required this.captureScreen,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }
  @observable
  bool isNavigatingAway = false;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    if (hasReceivedRoutingArgs) {
      await presence.listen();
    } else {
      showPresetInfo();
    }
    await userMetadata.getMetadata();
    await presence.updateCurrentPhase(1.0);
    await captureScreen(SessionConstants.lobby);
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
    if (hasReceivedRoutingArgs) {
      tapReactor();
      disposers.add(canStartTheSessionReactor());
    }
    disposers.add(sessionStartReactor());
    disposers.add(widgets.beachWavesMovieStatusReactor(enterGreeter));
    disposers.add(sessionPresetReactor());
  }

  canStartTheSessionReactor() =>
      reaction((p0) => sessionMetadata.canStartTheSession, (p0) {
        if (p0) {
          widgets.onCanStartTheSession();
        } else {
          widgets.onRevertCanStartSession();
        }
      });

  sessionPresetReactor() => reaction((p0) => sessionMetadata.presetTags, (p0) {
        widgets.onQrCodeReady(sessionMetadata.leaderUID);
        showPresetInfo();
      });

  @action
  showPresetInfo() {
    widgets.onPresetInfoRecieved(
      presetName: sessionMetadata.presetName,
      presetTags: sessionMetadata.presetTags,
    );
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() {
          if (sessionMetadata.canStartTheSession) {
            widgets.onTap(
              tap.currentTapPosition,
              onTap: () async {
                await presence.startTheSession();
                await captureStart(sessionMetadata.numberOfCollaborators);
                if (hasReceivedRoutingArgs &&
                    !sessionMetadata.isAValidSession) {
                  await activeMonetizationSession.startMonetizationSession();
                }
              },
            );
          }
        }),
      );

  sessionStartReactor() =>
      reaction((p0) => sessionMetadata.sessionHasBegun, (p0) {
        if (p0) {
          widgets.enterSession(sessionMetadata.isAValidSession);
        }
      });

  @action
  enterGreeter() => Modular.to.navigate(route);

  @computed
  String get route {
    if (groupIsLargerThanTwo) {
      if (isAPremiumSession) {
        if (sessionMetadata.isAValidSession) {
          return premiumSessionPath;
        } else {
          return monetizationSessionPath;
        }
      } else {
        return chooseGreeterType(SessionConstants.groupGreeter);
      }
    } else {
      return chooseGreeterType(SessionConstants.duoGreeter);
    }
  }

  deconstructor() {
    dispose();
    widgets.dispose();
  }

  @computed
  String get monetizationSessionPath => userMetadata.isSubscribed
      ? SessionConstants.waitingPatron
      : isNotSubscribedPath;

  String get isNotSubscribedPath => userMetadata.hasUsedTrial
      ? SessionConstants.paywall
      : SessionConstants.waitingPatron;

  @computed
  String get premiumSessionPath {
    return chooseGreeterType(isConsumingTrialSession
        ? SessionConstants.trialGreeter
        : SessionConstants.groupGreeter);
  }

  @computed
  bool get groupIsLargerThanTwo =>
      sessionMetadata.numberOfCollaborators.isGreaterThan(2);

  @computed
  bool get isConsumingTrialSession =>
      isAPremiumSession &&
      !userMetadata.hasUsedTrial &&
      !userMetadata.isSubscribed &&
      !sessionMetadata.leaderIsWhitelisted;

  @computed
  bool get isAPremiumSession =>
      sessionMetadata.numberOfCollaborators.isGreaterThanOrEqualTo(4);
}
