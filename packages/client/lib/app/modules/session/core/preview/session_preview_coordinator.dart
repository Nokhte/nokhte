// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'session_preview_coordinator.g.dart';

class SessionPreviewCoordinator = _SessionPreviewCoordinatorBase
    with _$SessionPreviewCoordinator;

abstract class _SessionPreviewCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionPreviewWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  _SessionPreviewCoordinatorBase({
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
    await presence.listen();
    await captureScreen(SessionConstants.preview);
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
    disposers.add(tapReactor());
    disposers.add(sessionPresetInfoReactor());
    disposers.add(rippleMovieStatusReactor());
  }

  sessionPresetInfoReactor() =>
      reaction((p0) => sessionMetadata.presetName, (p0) {
        widgets.onSessionTypeReceived(
          sessionName: p0,
          tags: sessionMetadata.tags,
        );
      });

  tapReactor() => reaction((p0) => tap.currentTapPosition,
      (p0) => ifTouchIsNotDisabled(() => widgets.onTap(p0)));

  rippleMovieStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(route, arguments: {});
        }
      });

  @computed
  String get route {
    if (sessionMetadata.instructionType ==
        SessionInstructionTypes.skipInstructions) {
      return SessionConstants.lobby;
    } else {
      if (sessionMetadata.presetType == PresetTypes.collaborative) {
        return _chooseInstructionType(
          fullInstructionsPath: SessionConstants.collaborationFullInstructions,
          justSymbolsPath: SessionConstants.collaborationJustSymbols,
        );
      } else if (sessionMetadata.presetType == PresetTypes.consultative) {
        return _chooseInstructionType(
          fullInstructionsPath: SessionConstants.consultationSpeakingSymbols,
          justSymbolsPath: SessionConstants.consultationJustSymbols,
        );
      } else if (sessionMetadata.presetType == PresetTypes.socratic) {
        return _chooseInstructionType(
          fullInstructionsPath: SessionConstants.socraticFullInstructions,
          justSymbolsPath: SessionConstants.socraticJustSymbols,
        );
      } else {
        return '';
      }
    }
  }

  String _chooseInstructionType({
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
}
