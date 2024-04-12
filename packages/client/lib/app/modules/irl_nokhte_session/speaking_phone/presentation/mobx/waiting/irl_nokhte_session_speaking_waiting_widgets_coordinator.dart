// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'irl_nokhte_session_speaking_waiting_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingWaitingWidgetsCoordinator = _IrlNokhteSessionSpeakingWaitingWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingWaitingWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingWaitingWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final TintStore tint;
  _IrlNokhteSessionSpeakingWaitingWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.tint,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingWaiting,
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
            () => Modular.to.navigate('/irl_nokhte_session/speaking'),
          );
        }
      });
}
