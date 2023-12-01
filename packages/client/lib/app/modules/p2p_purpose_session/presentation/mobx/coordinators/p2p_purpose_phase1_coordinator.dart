// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/abort_purpose_session_artifacts_store.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
part 'p2p_purpose_phase1_coordinator.g.dart';

class P2PPurposePhase1Coordinator = _P2PPurposePhase1CoordinatorBase
    with _$P2PPurposePhase1Coordinator;

abstract class _P2PPurposePhase1CoordinatorBase extends BaseCoordinator
    with Store {
  final VoiceCallCoordinator voiceCallCoordinator;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final P2PPurposePhase1WidgetsCoordinator widgets;
  final SwipeDetector swipe;

  _P2PPurposePhase1CoordinatorBase({
    required this.voiceCallCoordinator,
    required this.widgets,
    required this.swipe,
    required this.abortPurposeSessionArtifactsStore,
    // required super.beachWaves,
  });

  @action
  screenConstructorCallback() async {
    widgets.constructor();
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
    widgets.moveToPhase2();
    // gesturePillStore.setPillAnimationControl(Control.playFromStart);
    // fadingText.fadeTheTextOut();
    Future.delayed(Seconds.get(3), () {
      Modular.to.navigate('/p2p_purpose_session/phase-2/');
    });
  }
}
