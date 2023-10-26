// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
// import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase1_coordinator_store.g.dart';

class P2PPurposePhase1CoordinatorStore = _P2PPurposePhase1CoordinatorStoreBase
    with _$P2PPurposePhase1CoordinatorStore;

abstract class _P2PPurposePhase1CoordinatorStoreBase extends Equatable
    with Store {
  // Logic Stores
  final InstantiateAgoraSdkStore instantiateAgoraSdkStore;
  final GesturePillStore gesturePillStore;
  final FadeInAndChangeColorTextStore fadeInColorText;
  final FetchAgoraTokenStore fetchAgoraTokenStore;
  final FetchChannelIdStore fetchChannelIdStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  // final

  // Widget Stores
  final BeachWavesTrackerStore beachWaves;
  final SmartFadingAnimatedTextTrackerStore fadingText;

  _P2PPurposePhase1CoordinatorStoreBase({
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
  }

  @action
  swipeUpCallback() async {
    /// todo leave in for production
    // await voiceCallActionsStore.enterOrLeaveCall(
    //   Right(
    //     JoinCallParams(
    //       token: fetchAgoraTokenStore.token,
    //       channelId: fetchChannelIdStore.channelId,
    //     ),
    //   ),
    // );
    // await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
    // you then want to fade out the two texts
    // fadeInColorText.teeUpFadeOut();
    gesturePillStore.setPillAnimationControl(Control.playFromStart);
    fadingText.fadeTheTextOut();
    // fadingText.togglePause();
    Future.delayed(Seconds.get(3), () {
      // fadingText.moveToNextMessage();
      Modular.to.navigate('/p2p_purpose_session/phase-2/');
    });
  }

  @override
  List<Object> get props => [
// some items
      ];
}
