// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// import 'package:primala/app/core/types/call_status.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase1_coordinator_store.g.dart';

class P2PPurposePhase1CoordinatorStore = _P2PPurposePhase1CoordinatorStoreBase
    with _$P2PPurposePhase1CoordinatorStore;

abstract class _P2PPurposePhase1CoordinatorStoreBase extends Equatable
    with Store {
  // Logic Stores
  final InstantiateAgoraSdkStore instantiateAgoraSdkStore;
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
  });

  @action
  screenConstructorCallback() async {
    beachWaves.initiateSuspendedAtTheDepths();
    await instantiateAgoraSdkStore(NoParams());
    await fetchChannelIdStore(NoParams());
    print(
        "${fetchChannelIdStore.channelId} ${fetchChannelIdStore.channelId.runtimeType}");
    // .then((_) async {});
    await fetchAgoraTokenStore(
      FetchAgoraTokenParams(
        channelName: fetchChannelIdStore.channelId,
        // channelName: "hardcoded",
      ),
    );
    // print(
    //     "Let's see if this works, channel ID ==>  ${fetchChannelIdStore.channelId} Token ====> ${fetchAgoraTokenStore.token}");
  }

  @action
  swipeDownCallback() async {
    await voiceCallActionsStore.enterOrLeaveCall(
      Left(NoParams()),
    );
  }

  @action
  swipeUpCallback() async {
    // print("uhh did this run??");
    // await voiceCallActionsStore.joinCallGetterStore(
    //   channelId: fetchChannelIdStore.channelId,
    //   token: fetchAgoraTokenStore.token,
    // );
    // if (voiceCallActionsStore.callStatus == CallStatus.initial) {
    // print('initial one');
    await voiceCallActionsStore.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: fetchAgoraTokenStore.token,
          channelId: fetchChannelIdStore.channelId,
        ),
      ),
    );
    // } else {
    //   print('other one');
    // }
  }

  @override
  List<Object> get props => [
// some items
      ];
}
