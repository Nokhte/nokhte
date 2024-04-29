// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_notes_inactivity_widgets_coordinator.g.dart';

class SessionNotesInactivityWidgetsCoordinator = _SessionNotesInactivityWidgetsCoordinatorBase
    with _$SessionNotesInactivityWidgetsCoordinator;

abstract class _SessionNotesInactivityWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  final MirroredTextStore mirroredText;
  _SessionNotesInactivityWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.borderGlow,
    required this.mirroredText,
  });

  @observable
  bool rightSideUpHasBeenDismissed = false;

  @observable
  bool upsideDownHasBeenDismissed = false;

  @observable
  bool blockTouchRipple = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    mirroredText.setMessagesData(MirroredTextContent.speakLessWriteMore);
    mirroredText.startBothRotatingText();
    borderGlow.setAtCompleteWhiteOut();
    initReactors();
  }

  initReactors() {
    mirroredTextIndicesReactor();
  }

  initBorderGlowReactors({required Function onGlowDown}) {
    borderGlowMovieStatusReactor(
      onGlowDown: onGlowDown,
    );
  }

  borderGlowMovieStatusReactor({
    required Function onGlowDown,
  }) =>
      reaction((p0) => borderGlow.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (!borderGlow.isGlowingUp) {
            Modular.to.navigate("/session/notes");
          } else {
            //
          }
        }
      });

  mirroredTextIndicesReactor() =>
      reaction((p0) => mirroredText.isReadyToBeDismissed, (p0) {
        if (p0) {
          blockTouchRipple = true;
          borderGlow.initGlowDown();
          rightSideUpHasBeenDismissed = false;
          upsideDownHasBeenDismissed = false;
        }
      });

  onTap(Offset position) {
    if (!blockTouchRipple) {
      touchRipple.onTap(position, overridedColor: Colors.black);
      if (touchRipple.tapPlacement == GesturePlacement.topHalf &&
          !upsideDownHasBeenDismissed) {
        mirroredText.startRotatingUpsideDown(isResuming: true);
        upsideDownHasBeenDismissed = true;
      } else if (touchRipple.tapPlacement == GesturePlacement.bottomHalf &&
          !rightSideUpHasBeenDismissed) {
        mirroredText.startRotatingRightSideUp(isResuming: true);
        rightSideUpHasBeenDismissed = true;
      }
    }
  }

  @action
  onCollaboratorLeft() {}

  @action
  onCollaboratorJoined(Function onGlowInitated) {}
}
