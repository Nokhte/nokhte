// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'voice_call_coordinator.g.dart';

class VoiceCallCoordinator = _VoiceCallCoordinatorBase
    with _$VoiceCallCoordinator;

abstract class _VoiceCallCoordinatorBase extends Equatable with Store {
  final InstantiateAgoraSdkStore instantiateAgoraSdkStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final GetAgoraTokenStore getAgoraTokenStore;
  final GetChannelIdStore getChannelIdStore;
  _VoiceCallCoordinatorBase({
    required this.instantiateAgoraSdkStore,
    required this.voiceCallActionsStore,
    required this.getAgoraTokenStore,
    required this.getChannelIdStore,
  });

  @action
  joinCall({
    required bool shouldEnterTheCallMuted,
  }) async {
    await instantiateAgoraSdkStore(NoParams());
    await getChannelIdStore(NoParams());
    await getAgoraTokenStore(
      GetAgoraTokenParams(
        channelName: getChannelIdStore.channelId,
      ),
    );
    await voiceCallActionsStore.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: getAgoraTokenStore.token,
          channelId: getChannelIdStore.channelId,
        ),
      ),
    );
    await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
  }

  @action
  unmute() async =>
      await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);

  @action
  mute() async =>
      await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);

  @action
  leaveCall() async =>
      await voiceCallActionsStore.enterOrLeaveCall(Left(NoParams()));

  @override
  List<Object> get props => [
// some items
      ];
}
