// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_information_coordinator.g.dart';

class SessionInformationCoordinator = _SessionInformationCoordinatorBase
    with _$SessionInformationCoordinator;

abstract class _SessionInformationCoordinatorBase
    with Store, BaseCoordinator, Reactions, SessionPresence {
  final SessionInformationWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionMetadataStore sessionMetadata;
  final CaptureNokhteSessionStart captureStart;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final CaptureScreen captureScreen;

  _SessionInformationCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.captureStart,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() async {
    widgets.constructor(
      sessionName: sessionMetadata.presetName,
      tags: sessionMetadata.presetTags,
      phoneType: sessionMetadata.sessionScreenType,
    );
    initReactors();
    await captureScreen(SessionConstants.information);
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
    disposers.add(rippleReactor());
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() async {
          widgets.onTap(
            tap.currentTapPosition,
          );
        }),
      );

  rippleReactor() => reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(route);
        }
      });

  String chooseInstructionType({
    required String fullInstructionsPath,
    required String justSymbolsPath,
  }) {
    if (sessionMetadata.instructionType ==
        SessionInstructionTypes.fullInstructions) {
      return fullInstructionsPath;
    } else {
      return justSymbolsPath;
    }
  }

  @computed
  String get route {
    if (sessionMetadata.sessionScreenType == SessionScreenTypes.soloHybrid) {
      return SessionConstants.soloHybrid;
    } else if (sessionMetadata.sessionScreenType ==
        SessionScreenTypes.speaking) {
      return SessionConstants.speaking;
    } else if (sessionMetadata.sessionScreenType ==
        SessionScreenTypes.groupHybrid) {
      return SessionConstants.groupHybrid;
    } else {
      return SessionConstants.notes;
    }
  }

  deconstructor() {
    dispose();
  }
}
