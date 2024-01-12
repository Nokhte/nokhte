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
    i.addSingleton<RtcEngine>(() async {
      final agoraEngine = createAgoraRtcEngine();
      await agoraEngine.initialize(
          const RtcEngineContext(appId: '050b22b688f44464b2533fac484c7300'));
      return agoraEngine;
    });
    i.add<VoiceCallRemoteSourceImpl>(
      () => VoiceCallRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
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
    i.add<VoiceCallStatusStore>(
      (i) => VoiceCallStatusStore(
        agoraEngine: i<RtcEngine>(),
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
        voiceCallActions: i<VoiceCallActionsStore>(),
        voiceCallStatus: i<VoiceCallStatusStore>(),
        getAgoraToken: i<GetAgoraTokenStore>(),
        getChannelId: i<GetChannelIdStore>(),
      ),
    );
  }
}
