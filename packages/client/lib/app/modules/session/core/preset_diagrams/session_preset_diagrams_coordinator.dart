// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_preset_diagrams_coordinator.g.dart';

class SessionPresetDiagramsCoordinator = _SessionPresetDiagramsCoordinatorBase
    with _$SessionPresetDiagramsCoordinator;

abstract class _SessionPresetDiagramsCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionPresetDiagramsWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  _SessionPresetDiagramsCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore;

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(SessionConstants.presetDiagrams);
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
    disposers.add(tapReactor());
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() async {
          // widgets.onTap(
          //   tap.currentTapPosition,
          //   onTap: () async {},
          // );
        }),
      );

  @action
  enterGreeter() => Modular.to.navigate(route);

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
