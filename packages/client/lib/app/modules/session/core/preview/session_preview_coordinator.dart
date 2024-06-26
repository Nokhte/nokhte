// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_preview_coordinator.g.dart';

class SessionPreviewCoordinator = _SessionPreviewCoordinatorBase
    with _$SessionPreviewCoordinator;

abstract class _SessionPreviewCoordinatorBase with Store {
  final SessionPreviewWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final DeepLinksCoordinator deepLinks;
  final ActiveMonetizationSessionCoordinator activeMonetizationSession;
  final CaptureNokhteSessionStart captureStart;

  final BaseCoordinator base;

  _SessionPreviewCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.deepLinks,
    required this.captureStart,
    required this.tap,
    required this.presence,
    required this.activeMonetizationSession,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await presence.listen();
    await base.captureScreen(SessionConstants.preview);
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
    base.disposers.add(tapReactor());
    base.disposers.add(sessionPresetInfoReactor());
  }

  sessionPresetInfoReactor() =>
      reaction((p0) => sessionMetadata.presetName, (p0) {
        widgets.onSessionTypeReceived(
          sessionName: p0,
          tags: sessionMetadata.tags,
        );
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(() async {
          widgets.onTap(
            tap.currentTapPosition,
            onTap: () async {},
          );
        }),
      );

  @action
  enterGreeter() => Modular.to.navigate(route);

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }

  @computed
  String get route {
    return '';
    // if (groupIsLargerThanTwo) {
    //   if (isAPremiumSession) {
    //     if (sessionMetadata.isAValidSession) {
    //       return premiumSessionPath;
    //     } else {
    //       return monetizationSessionPath;
    //     }
    //   } else {
    //     return SessionConstants.groupGreeter;
    //   }
    // } else {
    //   return SessionConstants.duoGreeter;
    // }
  }
}
