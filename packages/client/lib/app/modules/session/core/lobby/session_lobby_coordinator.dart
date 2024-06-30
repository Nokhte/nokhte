// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_metadata/user_metadata.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_lobby_coordinator.g.dart';

class SessionLobbyCoordinator = _SessionLobbyCoordinatorBase
    with _$SessionLobbyCoordinator;

abstract class _SessionLobbyCoordinatorBase
    with Store, ChooseGreeterType, BaseCoordinator, Reactions {
  final SessionLobbyWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final UserMetadataCoordinator userMetadata;
  final DeepLinksCoordinator deepLinks;
  final ActiveMonetizationSessionCoordinator activeMonetizationSession;
  final CaptureNokhteSessionStart captureStart;
  @override
  final SessionMetadataStore sessionMetadata;
  @override
  final CaptureScreen captureScreen;

  _SessionLobbyCoordinatorBase({
    required this.widgets,
    required this.deepLinks,
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
    if (isTheLeader) {
      await presence.listen();
    } else {
      showPresetInfo();
    }
    await deepLinks.getDeepLink(DeepLinkTypes.nokhteSessionBearer);
    await userMetadata.getMetadata();
    await updateCurrentPhase();
    await captureScreen(SessionConstants.lobby);
  }

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (sessionMetadata.everyoneIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  @action
  initReactors() {
    disposers.add(deepLinkReactor());
    disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
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
    if (isTheLeader) {
      tapReactor();
      disposers.add(canStartTheSessionReactor());
    }
    disposers.add(sessionStartReactor());
    disposers.add(widgets.beachWavesMovieStatusReactor(enterGreeter));
    disposers.add(sessionPresetReactor());
  }

  @action
  updateCurrentPhase() async {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
      if (sessionMetadata.userPhase != 1.0) {
        await presence.updateCurrentPhase(1.0);
      } else {
        timer.cancel();
      }
    });
  }

  canStartTheSessionReactor() =>
      reaction((p0) => sessionMetadata.canStartTheSession, (p0) {
        if (p0) {
          widgets.onCanStartTheSession();
        }
      });

  sessionPresetReactor() => reaction((p0) => sessionMetadata.presetTags, (p0) {
        showPresetInfo();
      });

  @action
  showPresetInfo() {
    widgets.onPresetInfoRecieved(
      presetName: sessionMetadata.presetName,
      presetTags: sessionMetadata.presetTags,
    );
    //
  }
  // add the on ready to start reactor too

  deepLinkReactor() => reaction(
        (p0) => deepLinks.link,
        (p0) => widgets.onQrCodeReady(p0),
      );

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() {
          if (sessionMetadata.canStartTheSession) {
            widgets.onTap(
              tap.currentTapPosition,
              onTap: () async {
                await presence.startTheSession();
                await captureStart(sessionMetadata.numberOfCollaborators);
                if (isTheLeader && !sessionMetadata.isAValidSession) {
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
    widgets.base.deconstructor();
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

  @computed
  bool get isTheLeader => Modular.args.data["qrCodeData"] != null;
}
