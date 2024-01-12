import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VoiceCallModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<RtcEngine>(
      () => createAgoraRtcEngine(),
    );
    i.add<AgoraCallbacksStore>(
      () => AgoraCallbacksStore(),
    );
    i.add<VoiceCallRemoteSourceImpl>(
      () => VoiceCallRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
        agoraCallbacksStore: i<AgoraCallbacksStore>(),
        agoraEngine: i<RtcEngine>(),
      ),
    );
    i.add<VoiceCallContractImpl>(
      () => VoiceCallContractImpl(
        networkInfo: Modular.get<NetworkInfo>(),
        remoteSource: i<VoiceCallRemoteSource>(),
      ),
    );
    i.add<GetAgoraToken>(
      () => GetAgoraToken(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<GetChannelId>(
      () => GetChannelId(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<InstantiateAgoraSdk>(
      () => InstantiateAgoraSdk(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<JoinCall>(
      () => JoinCall(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<LeaveCall>(
      () => LeaveCall(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<MuteLocalAudio>(
      () => MuteLocalAudio(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<UnmuteLocalAudio>(
      () => UnmuteLocalAudio(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<GetAgoraTokenStore>(
      () => GetAgoraTokenStore(
        logic: i<GetAgoraToken>(),
      ),
    );
    i.add<GetChannelIdStore>(
      (i) => GetChannelIdStore(
        logic: i<GetChannelId>(),
      ),
    );
    i.add<InstantiateAgoraSdkStore>(
      (i) => InstantiateAgoraSdkStore(
        logic: i<InstantiateAgoraSdk>(),
      ),
    );
    i.add<VoiceCallActionsStore>(
      (i) => VoiceCallActionsStore(
        joinCall: i<JoinCall>(),
        leaveCall: i<LeaveCall>(),
        muteAudio: i<MuteLocalAudio>(),
        unmuteAudio: i<UnmuteLocalAudio>(),
      ),
    );
    i.add<VoiceCallCoordinator>(
      (i) => VoiceCallCoordinator(
        voiceCallActionsStore: i<VoiceCallActionsStore>(),
        instantiateAgoraSdkStore: i<InstantiateAgoraSdkStore>(),
        getAgoraTokenStore: i<GetAgoraTokenStore>(),
        getChannelIdStore: i<GetChannelIdStore>(),
      ),
    );
  }
}
