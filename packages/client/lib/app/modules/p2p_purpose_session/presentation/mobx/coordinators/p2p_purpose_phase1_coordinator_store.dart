// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'p2p_purpose_phase1_coordinator_store.g.dart';

class P2PPurposePhase1CoordinatorStore = _P2PPurposePhase1CoordinatorStoreBase
    with _$P2PPurposePhase1CoordinatorStore;

abstract class _P2PPurposePhase1CoordinatorStoreBase extends Equatable
    with Store {
  final InstantiateAgoraSdkStore instantiateAgoraSdkStore;
  final GesturePillStore gesturePillStore;
  final FadeInAndChangeColorTextStore fadeInColorText;
  final FetchAgoraTokenStore fetchAgoraTokenStore;
  final FetchChannelIdStore fetchChannelIdStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final SwipeDetector swipe;

  final BeachWavesTrackerStore beachWaves;
  final SmartFadingAnimatedTextTrackerStore fadingText;

  _P2PPurposePhase1CoordinatorStoreBase({
    required this.swipe,
    required this.instantiateAgoraSdkStore,
    required this.fetchAgoraTokenStore,
    required this.fetchChannelIdStore,
    required this.voiceCallActionsStore,
    required this.beachWaves,
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
    beachWaves.initiateSuspendedAtTheDepths();
    await instantiateAgoraSdkStore(NoParams());
    await fetchChannelIdStore(NoParams());
    await fetchAgoraTokenStore(
      FetchAgoraTokenParams(
        channelName: fetchChannelIdStore.channelId,
      ),
    );
    gestureListener();
  }

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            print("hi you working??");
            await joinTheCallAndMoveToPhase2();
          default:
            break;
        }
      });

  @action
  joinTheCallAndMoveToPhase2() async {
    print("You working???");
    await voiceCallActionsStore.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: fetchAgoraTokenStore.token,
          channelId: fetchChannelIdStore.channelId,
        ),
      ),
    );
    await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
    // you then want to fade out the two texts
    // fadeInColorText.teeUpFadeOut();
    gesturePillStore.setPillAnimationControl(Control.playFromStart);
    fadingText.fadeTheTextOut();
    Future.delayed(Seconds.get(3), () {
      Modular.to.navigate('/p2p_purpose_session/phase-2/');
    });
  }

  @override
  List<Object> get props => [];
}
