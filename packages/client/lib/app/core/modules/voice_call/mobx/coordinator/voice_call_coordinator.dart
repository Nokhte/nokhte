// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
part 'voice_call_coordinator.g.dart';

class VoiceCallCoordinator = _VoiceCallCoordinatorBase
    with _$VoiceCallCoordinator;

abstract class _VoiceCallCoordinatorBase extends BaseMobxDBStore with Store {
  final VoiceCallStatusStore voiceCallStatus;
  final VoiceCallActionsStore voiceCallActions;
  final GetAgoraToken getAgoraToken;
  final GetChannelId getChannelId;
  final InitAgoraSdk initAgoraSdk;
  _VoiceCallCoordinatorBase({
    required this.voiceCallStatus,
    required this.voiceCallActions,
    required this.getAgoraToken,
    required this.getChannelId,
    required this.initAgoraSdk,
  });

  @observable
  bool isInitialized = false;

  @observable
  String channelId = "";

  @observable
  String token = "";

  @observable
  RtcEngine rtcEngine = createAgoraRtcEngine();

  @action
  initSdk() async {
    if (!isInitialized) {
      state = StoreState.loading;
      rtcEngine = await initAgoraSdk(NoParams());
      voiceCallStatus.registerCallbacks(rtcEngine);
      isInitialized = true;
      state = StoreState.loaded;
    }
  }

  @action
  _getChannelId() async {
    state = StoreState.loading;
    final res = await getChannelId(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (newChannelId) => channelId = newChannelId,
    );
  }

  @action
  _getToken() async {
    state = StoreState.loading;
    final res =
        await getAgoraToken(GetAgoraTokenParams(channelName: channelId));
    res.fold(
      (failure) => errorUpdater(failure),
      (newToken) => token = newToken,
    );
  }

  @action
  joinCall({
    required bool shouldEnterTheCallMuted,
  }) async {
    await initSdk();
    await _getChannelId();
    await _getToken();
    await voiceCallActions.enterOrLeaveCall(
      Right(
        JoinCallParams(
          token: token,
          channelId: channelId,
        ),
      ),
    );
    await voiceCallActions.muteOrUnmuteAudio(
        wantToMute: shouldEnterTheCallMuted);
  }

  @action
  unmute() async => await voiceCallActions.muteOrUnmuteAudio(wantToMute: true);

  @action
  mute() async => await voiceCallActions.muteOrUnmuteAudio(wantToMute: false);

  @action
  leaveCall() async =>
      await voiceCallActions.enterOrLeaveCall(Left(NoParams()));

  @override
  List<Object> get props => [];
}
