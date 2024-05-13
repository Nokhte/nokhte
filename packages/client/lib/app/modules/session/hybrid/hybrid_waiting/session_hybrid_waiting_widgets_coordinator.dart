// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_hybrid_waiting_widgets_coordinator.g.dart';

class SessionHybridWaitingWidgetsCoordinator = _SessionHybridWaitingWidgetsCoordinatorBase
    with _$SessionHybridWaitingWidgetsCoordinator;

abstract class _SessionHybridWaitingWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final TintStore tint;
  _SessionHybridWaitingWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.tint,
  });

  @observable
  bool shouldMoveIntoSession = false;

  @action
  setShouldMoveIntoSession(bool value) => shouldMoveIntoSession = value;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedHalfAndHalfToDrySand);
    mirroredText.setMessagesData(
      MirroredTextContent.sessionHybridWaiting,
    );
    tint.setControl(Control.playFromStart);
    mirroredText.startBothRotatingText();
    rightSideUpIndexReactor();
  }

  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setRightsideUpVisibility(
      mirroredText.primaryRightSideUpText.pastShowWidget,
    );
    mirroredText.setUpsideDownVisibility(
      mirroredText.primaryUpsideDownText.pastShowWidget,
    );
  }

  @action
  onReadyToTransition() {
    mirroredText.startBothRotatingText(isResuming: true);
    tint.setControl(Control.playReverse);
  }

  rightSideUpIndexReactor() =>
      reaction((p0) => mirroredText.primaryRightSideUpText.currentIndex, (p0) {
        if (p0 == 1) {
          Timer(
            Seconds.get(1),
            () {
              if (shouldMoveIntoSession) {
                Modular.to.navigate(SessionConstants.hybrid);
              } else {
                Modular.to.navigate(SessionConstants.hybridNotesInstructions);
              }
            },
          );
        }
      });
}
