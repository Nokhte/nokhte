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
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_lobby_coordinator.g.dart';

class SessionLobbyCoordinator = _SessionLobbyCoordinatorBase
    with _$SessionLobbyCoordinator;

abstract class _SessionLobbyCoordinatorBase with Store {
  final SessionLobbyWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final UserMetadataCoordinator userMetadata;
  final DeepLinksCoordinator deepLinks;
  final ActiveMonetizationSessionCoordinator activeMonetizationSession;
  final CaptureNokhteSessionStart captureStart;
  final BaseCoordinator base;

  _SessionLobbyCoordinatorBase({
    required this.widgets,
    required this.deepLinks,
    required this.captureStart,
    required this.tap,
    required this.presence,
    required this.userMetadata,
    required this.activeMonetizationSession,
    required CaptureScreen captureScreen,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

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
    await presence.updateCurrentPhase(1.0);
    await base.captureScreen(SessionConstants.lobby);
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
    base.disposers.add(deepLinkReactor());
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        base.setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        base.setDisableAllTouchFeedback(true);
      },
    ));
    base.disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        base.setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        base.setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));
    if (isTheLeader) {
      tapReactor();
      base.disposers.add(canStartTheSessionReactor());
    }
    base.disposers.add(sessionStartReactor());
    base.disposers.add(widgets.beachWavesMovieStatusReactor(enterGreeter));
    base.disposers.add(sessionPresetReactor());
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
        (p0) => base.ifTouchIsNotDisabled(() {
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
        return SessionConstants.groupGreeter;
      }
    } else {
      return SessionConstants.duoGreeter;
    }
  }

  deconstructor() {
    base.deconstructor();
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
    return isConsumingTrialSession
        ? SessionConstants.trialGreeter
        : SessionConstants.groupGreeter;
  }

  @computed
  bool get groupIsLargerThanTwo =>
      sessionMetadata.numberOfCollaborators.isGreaterThan(2);

  @computed
  bool get isConsumingTrialSession =>
      !userMetadata.hasUsedTrial &&
      !userMetadata.isSubscribed &&
      !sessionMetadata.leaderIsWhitelisted;

  @computed
  bool get isAPremiumSession =>
      sessionMetadata.numberOfCollaborators.isGreaterThanOrEqualTo(4);

  @computed
  bool get isTheLeader => Modular.args.data["qrCodeData"] != null;
}
