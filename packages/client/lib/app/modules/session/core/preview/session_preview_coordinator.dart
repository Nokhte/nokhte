// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
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
    base.disposers.add(tapReactor());
    base.disposers.add(rippleReactor());
    base.disposers.add(sessionPresetInfoReactor());
  }

  sessionPresetInfoReactor() =>
      reaction((p0) => sessionMetadata.presetName, (p0) {
        widgets.onSessionTypeReceived(
          sessionName: p0,
          tags: sessionMetadata.presetTags,
        );
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(() async {
          widgets.onTap(
            tap.currentTapPosition,
          );
        }),
      );

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }

  rippleReactor() => reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(route, arguments: {});
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
    if (sessionMetadata.instructionType ==
        SessionInstructionTypes.skipInstructions) {
      return SessionConstants.lobby;
    } else {
      if (sessionMetadata.presetType == PresetTypes.collaborative) {
        return chooseInstructionType(
          fullInstructionsPath: SessionConstants.collaborationFullInstructions,
          justSymbolsPath: SessionConstants.collaborationJustSymbols,
        );
      } else if (sessionMetadata.presetType == PresetTypes.consultative) {
        return chooseInstructionType(
          fullInstructionsPath: SessionConstants.consultationSpeakingSymbols,
          justSymbolsPath: SessionConstants.consultationJustSymbols,
        );
      } else if (sessionMetadata.presetType == PresetTypes.socratic) {
        return chooseInstructionType(
          fullInstructionsPath: SessionConstants.socraticFullInstructions,
          justSymbolsPath: SessionConstants.socraticJustSymbols,
        );
      } else {
        return '';
      }
    }
  }
}
