// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
part 'voice_call_coordinator.g.dart';

class VoiceCallCoordinator = _VoiceCallCoordinatorBase
    with _$VoiceCallCoordinator;

abstract class _VoiceCallCoordinatorBase extends Equatable with Store {
  final VoiceCallStatusStore voiceCallStatus;
  final VoiceCallActionsStore voiceCallActions;
  final GetAgoraTokenStore getAgoraToken;
  final GetChannelIdStore getChannelId;
  _VoiceCallCoordinatorBase({
    required this.voiceCallStatus,
    required this.voiceCallActions,
    required this.getAgoraToken,
    required this.getChannelId,
  });

  @action
  joinCall({
    required bool shouldEnterTheCallMuted,
  }) async {
    await getChannelId(NoParams());
    await getAgoraToken(
      GetAgoraTokenParams(
        channelName: getChannelId.channelId,
      ),
    );
    await voiceCallActions.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: getAgoraToken.token,
          channelId: getChannelId.channelId,
        ),
      ),
    );
    await voiceCallActions.muteOrUnmuteAudio(wantToMute: true);
  }

  @action
  unmute() async => await voiceCallActions.muteOrUnmuteAudio(wantToMute: true);

  @action
  mute() async => await voiceCallActions.muteOrUnmuteAudio(wantToMute: false);

  @action
  leaveCall() async =>
      await voiceCallActions.enterOrLeaveCall(Left(NoParams()));

  @override
  List<Object> get props => [
// some items
      ];
}
