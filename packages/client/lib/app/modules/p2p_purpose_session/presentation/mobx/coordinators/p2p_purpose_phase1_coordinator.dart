// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/abort_purpose_session_artifacts_store.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'p2p_purpose_phase1_coordinator.g.dart';

class P2PPurposePhase1Coordinator = _P2PPurposePhase1CoordinatorBase
    with _$P2PPurposePhase1Coordinator;

abstract class _P2PPurposePhase1CoordinatorBase extends BaseCoordinator
    with Store {
  final VoiceCallCoordinator voiceCallCoordinator;
  final NewBeachWavesStore newBeachWaves;
  final GesturePillStore gesturePillStore;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final FadeInAndChangeColorTextStore fadeInColorText;
  final SwipeDetector swipe;
  final SmartFadingAnimatedTextTrackerStore fadingText;

  _P2PPurposePhase1CoordinatorBase({
    required this.voiceCallCoordinator,
    required this.newBeachWaves,
    required this.swipe,
    required this.abortPurposeSessionArtifactsStore,
    required super.beachWaves,
    required this.fadingText,
    required this.fadeInColorText,
    required this.gesturePillStore,
  });

  @action
  screenConstructorCallback() async {
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ], secondGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ]));
    fadingText.setMessagesData(MessagesData.p2pPurposeSession);
    fadingText.startRotatingText(Seconds.get(0));
    gestureListener();
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => null,
      inactiveCallback: () async => null,
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase1Greeter,
        ),
      ),
    );
    newBeachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
  }

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            await joinTheCallAndMoveToPhase2();
          default:
            break;
        }
      });

  @action
  joinTheCallAndMoveToPhase2() async {
    if (!kDebugMode) {
      await voiceCallCoordinator.joinCall(shouldEnterTheCallMuted: true);
    }
    gesturePillStore.setPillAnimationControl(Control.playFromStart);
    fadingText.fadeTheTextOut();
    Future.delayed(Seconds.get(3), () {
      Modular.to.navigate('/p2p_purpose_session/phase-2/');
    });
  }
}
